package of.paypal.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import of.member.model.Member;
import of.member.model.MemberService;
import of.member.model.Stored;
import of.member.model.StoredService;
import of.paypal.model.Order;
import of.paypal.model.PaypalService;
import of.shop.model.CartItem;

@Controller
@SessionAttributes(names = {"successMsg"})
public class PaypalController {

	@Autowired
	PaypalService service;
	@Autowired
	private MemberService memberService;
	@Autowired
	private StoredService storedService;
	@Autowired
	private APIContext apiContext;


	public static final String SUCCESS_URL = "/pay/success";
	public static final String CANCEL_URL = "/pay/cancel";
	
//	@PostMapping(path = "/pay2")
//	@ResponseBody
//	public Payment payment2() throws PayPalRESTException {
//		Payment payment =  null;
//		payment = service.createPayment("2700","TWD","paypal",
//				"sale", "test", "http://localhost:8080/OnlyFriends" + CANCEL_URL,
//				"http://localhost:8080/OnlyFriends" + SUCCESS_URL);
//		System.out.println(payment.toJSON());
//		return payment;
//	}
//	
	

	@PostMapping(path = "/pay")
	@ResponseBody
	public Payment payment(HttpServletRequest request) {
		Payment payment =  null;
		
		try {
			String num = request.getParameter("num");
			if("3".equals(num)) {
				Item i1 = new Item("邱比金幣三枚","1","99","TWD");
				//Item i2 = new Item("徽章","2","100","TWD");
				List<Item> listitem = new ArrayList<Item>();
				listitem.add(i1);
				//listitem.add(i2);
				ItemList itemlist = new ItemList();
				itemlist.setItems(listitem);
				
				Details details = new Details();
				details.setShipping("0");
				details.setTax("0");
				details.setSubtotal("99"); //商品總計
				payment = service.createPayment("99","TWD","paypal","sale","OnlyFriends", "http://localhost:8080/OnlyFriends" + CANCEL_URL,
						"http://localhost:8080/OnlyFriends" + SUCCESS_URL , itemlist, details);
			}
			else if("10".equals(num)) {
				Item i1 = new Item("邱比金幣十枚","1","199","TWD");
				List<Item> listitem = new ArrayList<Item>();
				listitem.add(i1);
				ItemList itemlist = new ItemList();
				itemlist.setItems(listitem);
				
				Details details = new Details();
				details.setShipping("0");
				details.setTax("0");
				details.setSubtotal("199");
				payment = service.createPayment("199","TWD","paypal","sale","OnlyFriends", "http://localhost:8080/OnlyFriends" + CANCEL_URL
						,"http://localhost:8080/OnlyFriends" + SUCCESS_URL , itemlist, details);			
			}
	
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

	@PostMapping(path = "/payproduct")
	@ResponseBody
	public Payment paymentproduct(HttpServletRequest request) {
		Order order = null;
		Payment payment =  null;
		try {
			System.out.println("step1");
			List<CartItem> cartlist=(List<CartItem>) request.getSession().getAttribute("cartlist");
			Integer finaltotal=0;
			List<Item> listitem = new ArrayList<Item>();
			for (CartItem c : cartlist) {
				String orderName = new String(c.getProduct().getProName());
				String orderAmount = Integer.toString(c.getAmount());
				String orderPrice = Integer.toString(c.getProduct().getProPrice());
				
				finaltotal+=c.getProduct().getProPrice()*c.getAmount();
				Item orderItem = new Item(orderName,orderAmount,orderPrice,"TWD");
				
				listitem.add(orderItem);
			}
			//listitem.add(i2);
			ItemList itemlist = new ItemList();
			itemlist.setItems(listitem);
			
			String finaltotalString = Integer.toString(finaltotal);
			
			Details details = new Details();
			details.setShipping("0");
			details.setTax("0");
			details.setSubtotal(finaltotalString); //商品總計
			payment = service.createPayment(finaltotalString,"TWD","paypal","sale","OnlyFriends", "http://localhost:8080/OnlyFriends" + CANCEL_URL,
					"http://localhost:8080/OnlyFriends" + SUCCESS_URL , itemlist, details);
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
			//System.out.println(paymentId);
			payment = service.executePayment(paymentId, payerId);
			//System.out.println(payment.toJSON());
			String total = payment.getTransactions().get(0).getAmount().getTotal();
			Float ftotal = Float.parseFloat(total);
			Member m1 = (Member) request.getSession().getAttribute("personalinfo");
			String memberAccount = m1.getMemberAccount();
			Member m2 = memberService.findByMemberAccount(memberAccount);
			String newswipetime = null;
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());	
			
			if(ftotal>199) {
				
				
				
				
			}
			
		
			
			if("199.00".equals(total)) {	
				Stored stored = new Stored(payment.getId(),memberAccount,timestamp,ftotal);
				storedService.insert(stored);
				newswipetime = String.valueOf(Integer.parseInt(m2.getSwipeTime())+10) ; 
				m2.setSwipeTime(newswipetime);
				memberService.update(m2);
			}
			else if("99.00".equals(total)) {
				Stored stored = new Stored(payment.getId(),memberAccount,timestamp,ftotal);
				storedService.insert(stored);
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
