package of.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import of.common.model.Users;
import of.common.model.UsersService;
import of.member.model.Member;
import of.member.model.MemberService;
import of.shop.model.OrderDetails;
import of.shop.model.OrderPayPalService;
import of.shop.model.PaymentService;

public class AuthorizePayment {
	
	
	private OrderPayPalService orderPayPalService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private Member member;
	@Autowired
	private UsersService usersService;
	@Autowired
	private Users users;
	
	public static final String SUCCESS_URL = "/pay/success";
	public static final String CANCEL_URL = "/pay/cancel";
	
	@GetMapping("/paypal.contorller")
	public String paypalString(@RequestParam(name = "product")String product,
								@RequestParam(name="subtotal")float subtotal,
								@RequestParam(name = "total")float total,HttpServletRequest request) {
		OrderDetails orderDetails =new OrderDetails();
		
		try {
			Payment payment = orderPayPalService.createPayment( null, orderDetails.getCurrency(), orderDetails.getMethod(),
					orderDetails.getIntent(), orderDetails.getDescription(), "http://localhost:8080/OnlyFriends" + CANCEL_URL,
					"http://localhost:8080/OnlyFriends" + SUCCESS_URL, orderDetails);
			for (Links link : payment.getLinks()) {
				if (link.getRel().equals("approval_url")) {
					return "redirect:" + link.getHref();
				}
			}
//			String approvalLink =orderPayPalService.createPayment(orderDetails);
		} catch (PayPalRESTException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return "redirect:/";
	}
	
	@GetMapping("/review_payment")
	public String reviewPayPal(@RequestParam(name = "paymentId")String paymentIdString,
								@RequestParam(name="PayerID")String PayerID,HttpServletRequest request) throws ServletException, IOException {
		try {
			Payment payment = orderPayPalService.getPaymentDetails(paymentIdString);
			
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
			
			request.setAttribute("payer", payerInfo);
			request.setAttribute("transaction", payerInfo);
			request.setAttribute("shippingAddress", payerInfo);
			
			String url = "review.jsp?paymentId=" + paymentIdString + "&PayerID=" + PayerID;
			request.getRequestDispatcher(url).forward(request, null);
			
		} catch (PayPalRESTException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
		
	}	
	
	@GetMapping("/execute_payment")
	public String ExecutePayment (@RequestParam(name = "paymentId") String paymentId,
									@RequestParam(name = "PayerID")String payerId,HttpServletRequest request) throws ServletException, IOException {
		try {
			Payment payment = orderPayPalService.executePayment(paymentId, payerId);
			
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			
			request.setAttribute("payer", payerInfo);
			request.setAttribute("transaction", payerInfo);
			
			request.getRequestDispatcher("receipt.jsp").forward(request, null);
		} catch (PayPalRESTException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("errorMessage", "Could not get payment details");
			request.getRequestDispatcher("error.jsp").forward(request, null);
		}
		
		return "";
	}
	
	
}
