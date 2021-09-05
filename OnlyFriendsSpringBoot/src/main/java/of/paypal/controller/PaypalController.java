package of.paypal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.paypal.api.payments.Links;
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
	public String payment() {
		try {
			Order order = new Order(99,"TWD","paypal","sale","邱比金幣三枚");
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
			System.out.println(payment.toJSON());
			if (payment.getState().equals("approved")) {
				
				Member m1 = (Member) request.getSession().getAttribute("personalinfo");
				String memberAccount = m1.getMemberAccount();
				Member m2 = memberService.findByMemberAccount(memberAccount);
				String newswipetime = String.valueOf(Integer.parseInt(m2.getSwipeTime())+3) ; 
				m2.setSwipeTime(newswipetime);
				memberService.update(m2);

				model.addAttribute("successMsg","邱比寶寶分派三枚硬幣給你");
				return "redirect:/memberswipeloading";
			}
		} catch (PayPalRESTException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			model.addAttribute("successMsg","發生問題，請稍後再試");
		}
		return "redirect:/memberswipeloading";

	}
}
