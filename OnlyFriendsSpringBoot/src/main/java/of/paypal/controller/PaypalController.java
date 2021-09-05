package of.paypal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

import of.chat.model.Chat;
import of.chat.model.ChatService;
import of.common.model.Users;
import of.common.model.UsersService;
import of.member.model.Member;
import of.member.model.MemberService;
import of.paypal.model.Order;
import of.paypal.model.PaypalService;

@Controller
@SessionAttributes(names = {"successMsg"})
public class PaypalController {

	@Autowired
	PaypalService service;
	@Autowired
	private MemberService memberService;
	@Autowired
	private Member member;
	@Autowired
	private UsersService usersService;
	@Autowired
	private Users users;
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplete;
	@Autowired
	private Chat chat;
	@Autowired
	private ChatService chatService;

	public static final String SUCCESS_URL = "/pay/success";
	public static final String CANCEL_URL = "/pay/cancel";

	@GetMapping(path = "/pay")
	public String payment(HttpServletRequest request) {
		Order order = null;
		try {
	
			String num = request.getParameter("num");
			if("3".equals(num)) {
				order = new Order(99,"TWD","paypal","sale","邱比金幣三枚");
			}
			else if("10".equals(num)) {
				order = new Order(199,"TWD","paypal","sale","邱比金幣十枚");
			}
			
			Payment payment = service.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
					order.getIntent(), order.getDescription(), "http://localhost:8080/OnlyFriends" + CANCEL_URL,
					"http://localhost:8080/OnlyFriends" + SUCCESS_URL);
			for (Links link : payment.getLinks()) {
				if (link.getRel().equals("approval_url")) {
					return "redirect:" + link.getHref();
				}
			}
		} catch (PayPalRESTException e) {

			e.printStackTrace();
		}

		return "redirect:/";
	}

	@GetMapping(value = CANCEL_URL)
	public String cnacelPay() {
		return "cancle";
	}

	@GetMapping(value = SUCCESS_URL)
	public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId,Model model,HttpServletRequest request) {

		try {
			Payment payment = service.executePayment(paymentId, payerId);
			Payer p = payment.getPayer();
			String payername = p.getPayerInfo().getFirstName();
			String total = payment.getTransactions().get(0).getAmount().getTotal();
			String newswipetime = null;
			System.out.println("total:"+total);
			System.out.println(payment.toJSON());
			if(payment.getState().equals("approved")) {
				
				Member m1 = (Member) request.getSession().getAttribute("personalinfo");
				String memberAccount = m1.getMemberAccount();
				Member m2 = memberService.findByMemberAccount(memberAccount);
				
				if("199.00".equals(total)) {
					newswipetime = String.valueOf(Integer.parseInt(m2.getSwipeTime())+10) ; 
					m2.setSwipeTime(newswipetime);
				}
				else if("99.00".equals(total)) {
					newswipetime = String.valueOf(Integer.parseInt(m2.getSwipeTime())+3) ; 
					m2.setSwipeTime(newswipetime);
				}
				String successMsg = "<h5>感謝 "+payername+"</h5><br>"+
									"<h5>邱比已將金幣分派給你了<h5>"
													;
				memberService.update(m2);
				model.addAttribute("successMsg",successMsg);
				return "redirect:/memberswipeloading";
			}
		} catch (PayPalRESTException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			model.addAttribute("errorMsg","發生問題，請稍後再試");
		}
		return "redirect:/memberswipeloading";

	}
}
