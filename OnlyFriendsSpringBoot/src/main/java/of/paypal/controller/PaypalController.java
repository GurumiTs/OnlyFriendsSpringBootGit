package of.paypal.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.paypal.orders.OrdersCreateRequest;

import of.member.model.Member;
import of.member.model.MemberService;
import of.member.model.Stored;
import of.member.model.StoredService;
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
	private StoredService storedService;

	public static final String SUCCESS_URL = "/pay/success";
	public static final String CANCEL_URL = "/pay/cancel";
	

	@PostMapping(path = "/pay")
	@ResponseBody
	public Payment payment(HttpServletRequest request) {
		Order order = null;
		Payment payment =  null;
		try {
			System.out.println("step1");
			String num = request.getParameter("num");
			System.out.println("num"+num);
			if("3".equals(num)) {
				order = new Order(99,"TWD","paypal","sale","邱比金幣三枚");
			}
			else if("10".equals(num)) {
				order = new Order(199,"TWD","paypal","sale","邱比金幣十枚");
			}
			 payment = service.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
					order.getIntent(), order.getDescription(), "http://localhost:8080/OnlyFriends" + CANCEL_URL,
					"http://localhost:8080/OnlyFriends" + SUCCESS_URL);
			
			//data = payment.toJSON();
			
			for (Links link : payment.getLinks()) {
				if (link.getRel().equals("approval_url")) {
					//System.out.println("link href:"+link.getHref().toString());					
					return payment;

				}
			}
		} catch (PayPalRESTException e) {

			e.printStackTrace();
		}

		return payment;
	}

	@PostMapping(value = CANCEL_URL)
	public String cnacelPay() {
		return "cancle";
	}

	@PostMapping(value = SUCCESS_URL)
	@ResponseBody
	public Payment successPay(@RequestParam("paymentID") String paymentId, @RequestParam("payerID") String payerId,Model model,HttpServletRequest request) {
		Payment payment = null;
		try {
			System.out.println(paymentId);
			payment = service.executePayment(paymentId, payerId);
			System.out.println(payment.toJSON());
			String total = payment.getTransactions().get(0).getAmount().getTotal();
			Float ftotal = Float.parseFloat(total);
			Member m1 = (Member) request.getSession().getAttribute("personalinfo");
			String memberAccount = m1.getMemberAccount();
			Member m2 = memberService.findByMemberAccount(memberAccount);
			String newswipetime = null;
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());			
			Stored stored = new Stored(payment.getId(),memberAccount,timestamp,ftotal);
			storedService.insert(stored);
			
			if("199.00".equals(total)) {
				newswipetime = String.valueOf(Integer.parseInt(m2.getSwipeTime())+10) ; 
				m2.setSwipeTime(newswipetime);
				memberService.update(m2);
			}
			else if("99.00".equals(total)) {
				newswipetime = String.valueOf(Integer.parseInt(m2.getSwipeTime())+3) ; 
				m2.setSwipeTime(newswipetime);
				memberService.update(m2);
			}
			
		} catch (PayPalRESTException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			
		}
		return payment;

	}
}
