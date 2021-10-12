package of.paypal.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

import of.member.model.Member;
import of.member.model.MemberService;
import of.member.model.Stored;
import of.member.model.StoredService;
import of.paypal.model.Order;
import of.paypal.model.PaypalService;
import of.product.model.Product;
import of.product.model.ProductService;
import of.shop.model.CartItem;
import of.shop.model.OrderDetails;
import of.shop.model.OrderItemService;
import of.shop.model.OrderService;

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
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	private JavaMailSender sender;

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
	public Payment paymentproduct(@RequestParam(name = "discounttotal")String discounttotal,HttpServletRequest request) {
		Order order = null;
		Payment payment =  null;
		System.out.println(discounttotal);
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
				
				int d = Integer.parseInt(discounttotal);
				String discountvalue = Integer.toString(finaltotal - d);
				System.out.println("discountvalue"+discountvalue);
				if(discountvalue.equals("0")) {
					ItemList itemlist = new ItemList();
					itemlist.setItems(listitem);
					
					String finaltotalString = Integer.toString(finaltotal);
					
					Details details = new Details();
					details.setShipping("0");
					details.setTax("0");
					details.setSubtotal(finaltotalString); //商品總計
					payment = service.createPayment(finaltotalString,"TWD","paypal","sale","OnlyFriends", "http://localhost:8080/OnlyFriends" + CANCEL_URL,
							"http://localhost:8080/OnlyFriends" + SUCCESS_URL , itemlist, details);
					
					
					
					
				}else{
					Item dItem =  new Item("discount","1","-"+discountvalue,"TWD");
					listitem.add(dItem);		
					ItemList itemlist = new ItemList();
					itemlist.setItems(listitem);
					Details details = new Details();
					details.setShipping("0");
					details.setTax("0");
					details.setSubtotal(discounttotal); //商品總計
					payment = service.createPayment(discounttotal,"TWD","paypal","sale","OnlyFriends", "http://localhost:8080/OnlyFriends" + CANCEL_URL,
							"http://localhost:8080/OnlyFriends" + SUCCESS_URL , itemlist, details);
					//data = payment.toJSON();
				}
			
			
			
			//listitem.add(i2);
			
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
			System.out.println(payment.toJSON());
			String total = payment.getTransactions().get(0).getAmount().getTotal();
			Float ftotal = Float.parseFloat(total);
			Member m1 = (Member) request.getSession().getAttribute("personalinfo");
			String memberAccount = m1.getMemberAccount();
			Member m2 = memberService.findByMemberAccount(memberAccount);
			String memberEmail = m2.getMemberEmail();
			String newswipetime = null;
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());	
			
			if(ftotal>199) { 

				List<CartItem> cartlist = (List<CartItem>) request.getSession().getAttribute("cartlist"); 
				List<Product> productlist=  new ArrayList<>();
				List<Integer> amountlist = new ArrayList<>();
				List<Integer> ppidList = new ArrayList<>();
				Integer finaltotal=0;
				Integer afterdiscountInteger = ftotal.intValue();
				for(CartItem cartItem:cartlist) {
					productlist.add(productService.findById(cartItem.getProduct().getProId()));
					amountlist.add(cartItem.getAmount());
					ppidList.add(cartItem.getProduct().getProId());
					finaltotal+=cartItem.getProduct().getProPrice()*cartItem.getAmount();
				}
				Integer discountInteger = finaltotal - afterdiscountInteger;
				OrderDetails orderDetails = new OrderDetails();
				orderDetails.setPaymentId(payment.getId()); 
				orderDetails.setOrderAddress(payment.getPayer().getPayerInfo().getShippingAddress().toString());
				orderDetails.setMemberAccount(memberAccount);
				orderDetails.setTotal(ftotal);
				orderDetails.setOrderTime(timestamp); 
				orderDetails.setOrderItem(productlist); 
				orderDetails.setOrderDiscount(discountInteger.toString());
				orderDetails.setOrderStatus("待出貨");
				
				
				orderService.insert(orderDetails);
				
				List<Product> orderitem = orderDetails.getOrderItem();			
				int a = 0;
				for(Integer i : amountlist) {
					System.out.println("i"+i);					
					int ppid = ppidList.get(a);
					a++;
					System.out.println("ppid"+ppid);				
					orderItemService.updateamount(i, paymentId, ppid);
								
				} 
				try {
					MimeMessage mimeMessage = sender.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
					String htmlMsg = "<!DOCTYPE html>\r\n"
							+ "<html>\r\n"
							+ "  <head>\r\n"
							+ "    <title></title>\r\n"
							+ "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n"
							+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\r\n"
							+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\r\n"
							+ "    <style type=\"text/css\">\r\n"
							+ "      @media screen {\r\n"
							+ "        @font-face {\r\n"
							+ "          font-family: \"Lato\";\r\n"
							+ "          font-style: normal;\r\n"
							+ "          font-weight: 400;\r\n"
							+ "          src: local(\"Lato Regular\"), local(\"Lato-Regular\"),\r\n"
							+ "            url(https://fonts.gstatic.com/s/lato/v11/qIIYRU-oROkIk8vfvxw6QvesZW2xOQ-xsNqO47m55DA.woff)\r\n"
							+ "              format(\"woff\");\r\n"
							+ "        }\r\n"
							+ "\r\n"
							+ "        @font-face {\r\n"
							+ "          font-family: \"Lato\";\r\n"
							+ "          font-style: normal;\r\n"
							+ "          font-weight: 700;\r\n"
							+ "          src: local(\"Lato Bold\"), local(\"Lato-Bold\"),\r\n"
							+ "            url(https://fonts.gstatic.com/s/lato/v11/qdgUG4U09HnJwhYI-uK18wLUuEpTyoUstqEm5AMlJo4.woff)\r\n"
							+ "              format(\"woff\");\r\n"
							+ "        }\r\n"
							+ "\r\n"
							+ "        @font-face {\r\n"
							+ "          font-family: \"Lato\";\r\n"
							+ "          font-style: italic;\r\n"
							+ "          font-weight: 400;\r\n"
							+ "          src: local(\"Lato Italic\"), local(\"Lato-Italic\"),\r\n"
							+ "            url(https://fonts.gstatic.com/s/lato/v11/RYyZNoeFgb0l7W3Vu1aSWOvvDin1pK8aKteLpeZ5c0A.woff)\r\n"
							+ "              format(\"woff\");\r\n"
							+ "        }\r\n"
							+ "\r\n"
							+ "        @font-face {\r\n"
							+ "          font-family: \"Lato\";\r\n"
							+ "          font-style: italic;\r\n"
							+ "          font-weight: 700;\r\n"
							+ "          src: local(\"Lato Bold Italic\"), local(\"Lato-BoldItalic\"),\r\n"
							+ "            url(https://fonts.gstatic.com/s/lato/v11/HkF_qI1x_noxlxhrhMQYELO3LdcAZYWl9Si6vvxL-qU.woff)\r\n"
							+ "              format(\"woff\");\r\n"
							+ "        }\r\n"
							+ "      }\r\n"
							+ "\r\n"
							+ "      /* CLIENT-SPECIFIC STYLES */\r\n"
							+ "      body,\r\n"
							+ "      table,\r\n"
							+ "      td,\r\n"
							+ "      a {\r\n"
							+ "        -webkit-text-size-adjust: 100%;\r\n"
							+ "        -ms-text-size-adjust: 100%;\r\n"
							+ "      }\r\n"
							+ "\r\n"
							+ "      table,\r\n"
							+ "      td {\r\n"
							+ "        mso-table-lspace: 0pt;\r\n"
							+ "        mso-table-rspace: 0pt;\r\n"
							+ "      }\r\n"
							+ "\r\n"
							+ "      img {\r\n"
							+ "        -ms-interpolation-mode: bicubic;\r\n"
							+ "      }\r\n"
							+ "\r\n"
							+ "      /* RESET STYLES */\r\n"
							+ "      img {\r\n"
							+ "        border: 0;\r\n"
							+ "        height: auto;\r\n"
							+ "        line-height: 100%;\r\n"
							+ "        outline: none;\r\n"
							+ "        text-decoration: none;\r\n"
							+ "      }\r\n"
							+ "\r\n"
							+ "      table {\r\n"
							+ "        border-collapse: collapse !important;\r\n"
							+ "      }\r\n"
							+ "\r\n"
							+ "      body {\r\n"
							+ "        height: 100% !important;\r\n"
							+ "        margin: 0 !important;\r\n"
							+ "        padding: 0 !important;\r\n"
							+ "        width: 100% !important;\r\n"
							+ "      }\r\n"
							+ "\r\n"
							+ "      /* iOS BLUE LINKS */\r\n"
							+ "      a[x-apple-data-detectors] {\r\n"
							+ "        color: inherit !important;\r\n"
							+ "        text-decoration: none !important;\r\n"
							+ "        font-size: inherit !important;\r\n"
							+ "        font-family: inherit !important;\r\n"
							+ "        font-weight: inherit !important;\r\n"
							+ "        line-height: inherit !important;\r\n"
							+ "      }\r\n"
							+ "\r\n"
							+ "      /* MOBILE STYLES */\r\n"
							+ "      @media screen and (max-width: 600px) {\r\n"
							+ "        h1 {\r\n"
							+ "          font-size: 32px !important;\r\n"
							+ "          line-height: 32px !important;\r\n"
							+ "        }\r\n"
							+ "      }\r\n"
							+ "\r\n"
							+ "      /* ANDROID CENTER FIX */\r\n"
							+ "      div[style*=\"margin: 16px 0;\"] {\r\n"
							+ "        margin: 0 !important;\r\n"
							+ "      }\r\n"
							+ "    </style>\r\n"
							+ "  </head>\r\n"
							+ "\r\n"
							+ "  <body\r\n"
							+ "    style=\"\r\n"
							+ "      background-color: #f4f4f4;\r\n"
							+ "      margin: 0 !important;\r\n"
							+ "      padding: 0 !important;\r\n"
							+ "    \"\r\n"
							+ "  >\r\n"
							+ "    <!-- HIDDEN PREHEADER TEXT -->\r\n"
							+ "    <div\r\n"
							+ "      style=\"\r\n"
							+ "        display: none;\r\n"
							+ "        font-size: 1px;\r\n"
							+ "        color: #fefefe;\r\n"
							+ "        line-height: 1px;\r\n"
							+ "        font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
							+ "        max-height: 0px;\r\n"
							+ "        max-width: 0px;\r\n"
							+ "        opacity: 0;\r\n"
							+ "        overflow: hidden;\r\n"
							+ "      \"\r\n"
							+ "    ></div>\r\n"
							+ "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
							+ "      <!-- LOGO -->\r\n"
							+ "      <tr>\r\n"
							+ "        <td bgcolor=\"#6777ef\" align=\"center\">\r\n"
							+ "          <table\r\n"
							+ "            border=\"0\"\r\n"
							+ "            cellpadding=\"0\"\r\n"
							+ "            cellspacing=\"0\"\r\n"
							+ "            width=\"100%\"\r\n"
							+ "            style=\"max-width: 600px\"\r\n"
							+ "          >\r\n"
							+ "            <tr>\r\n"
							+ "              <td\r\n"
							+ "                align=\"center\"\r\n"
							+ "                valign=\"top\"\r\n"
							+ "                style=\"padding: 40px 10px 40px 10px\"\r\n"
							+ "              ></td>\r\n"
							+ "            </tr>\r\n"
							+ "          </table>\r\n"
							+ "        </td>\r\n"
							+ "      </tr>\r\n"
							+ "      <tr>\r\n"
							+ "        <td bgcolor=\"#6777ef\" align=\"center\" style=\"padding: 0px 10px 0px 10px\">\r\n"
							+ "          <table\r\n"
							+ "            border=\"0\"\r\n"
							+ "            cellpadding=\"0\"\r\n"
							+ "            cellspacing=\"0\"\r\n"
							+ "            width=\"100%\"\r\n"
							+ "            style=\"max-width: 600px\"\r\n"
							+ "          >\r\n"
							+ "            <tr>\r\n"
							+ "              <td\r\n"
							+ "                bgcolor=\"#ffffff\"\r\n"
							+ "                align=\"center\"\r\n"
							+ "                valign=\"top\"\r\n"
							+ "                style=\"\r\n"
							+ "                  padding: 40px 20px 20px 20px;\r\n"
							+ "                  border-radius: 4px 4px 0px 0px;\r\n"
							+ "                  color: #111111;\r\n"
							+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
							+ "                  font-size: 48px;\r\n"
							+ "                  font-weight: 400;\r\n"
							+ "                  letter-spacing: 4px;\r\n"
							+ "                  line-height: 48px;\r\n"
							+ "                \"\r\n"
							+ "              >\r\n"
							+ "                <h1 style=\"font-size: 48px; font-weight: 400; margin: 2\">\r\n"
							+ 					m2.getMemberName()+"先生/小姐 您好:\r\n"
							+ "                  <br/>您購買的商品編號為: <br/>\""+orderDetails.getPaymentId()+"\"<br/>已成立訂單。\r\n"
							+ "                  <br/>於此信通知您，謝謝您的投稿。\r\n"
							+ "                </h1>\r\n"
							+ "                <img\r\n"
							+ "                  src=\" https://img.icons8.com/clouds/100/000000/handshake.png\"\r\n"
							+ "                  width=\"125\"\r\n"
							+ "                  height=\"120\"\r\n"
							+ "                  style=\"display: block; border: 0px\"\r\n"
							+ "                />\r\n"
							+ "              </td>\r\n"
							+ "            </tr>\r\n"
							+ "          </table>\r\n"
							+ "        </td>\r\n"
							+ "      </tr>\r\n"
							+ "      <tr>\r\n"
							+ "        <td bgcolor=\"#f4f4f4\" align=\"center\" style=\"padding: 0px 10px 0px 10px\">\r\n"
							+ "          <table\r\n"
							+ "            border=\"0\"\r\n"
							+ "            cellpadding=\"0\"\r\n"
							+ "            cellspacing=\"0\"\r\n"
							+ "            width=\"100%\"\r\n"
							+ "            style=\"max-width: 600px\"\r\n"
							+ "          >\r\n"
							+ "            <tr>\r\n"
							+ "              <td\r\n"
							+ "                bgcolor=\"#ffffff\"\r\n"
							+ "                align=\"left\"\r\n"
							+ "                style=\"\r\n"
							+ "                  padding: 20px 30px 40px 30px;\r\n"
							+ "                  color: #666666;\r\n"
							+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
							+ "                  font-size: 18px;\r\n"
							+ "                  font-weight: 400;\r\n"
							+ "                  line-height: 25px;\r\n"
							+ "                \"\r\n"
							+ "              ></td>\r\n"
							+ "            </tr>\r\n"					
							+ "            <!-- COPY -->\r\n"
							+ "            <tr>\r\n"
							+ "              <td\r\n"
							+ "                bgcolor=\"#ffffff\"\r\n"
							+ "                align=\"left\"\r\n"
							+ "                style=\"\r\n"
							+ "                  padding: 0px 30px 0px 30px;\r\n"
							+ "                  color: #666666;\r\n"
							+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
							+ "                  font-size: 18px;\r\n"
							+ "                  font-weight: 400;\r\n"
							+ "                  line-height: 25px;\r\n"
							+ "                \"\r\n"
							+ "              ></td>\r\n"
							+ "            </tr>\r\n"
							+ "            <!-- COPY -->\r\n"
							+ "            <tr>\r\n"
							+ "              <td\r\n"
							+ "                bgcolor=\"#ffffff\"\r\n"
							+ "                align=\"left\"\r\n"
							+ "                style=\"\r\n"
							+ "                  padding: 20px 30px 20px 30px;\r\n"
							+ "                  color: #666666;\r\n"
							+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
							+ "                  font-size: 18px;\r\n"
							+ "                  font-weight: 400;\r\n"
							+ "                  line-height: 25px;\r\n"
							+ "                \"\r\n"
							+ "              ></td>\r\n"
							+ "            </tr>\r\n"
							+ "            <tr>\r\n"
							+ "              <td\r\n"
							+ "                bgcolor=\"#ffffff\"\r\n"
							+ "                align=\"left\"\r\n"
							+ "                style=\"\r\n"
							+ "                  padding: 0px 30px 20px 30px;\r\n"
							+ "                  color: #666666;\r\n"
							+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
							+ "                  font-size: 18px;\r\n"
							+ "                  font-weight: 400;\r\n"
							+ "                  line-height: 25px;\r\n"
							+ "                \"\r\n"
							+ "              ></td>\r\n"
							+ "            </tr>\r\n"
							+ "            <tr>\r\n"
							+ "              <td\r\n"
							+ "                bgcolor=\"#ffffff\"\r\n"
							+ "                align=\"left\"\r\n"
							+ "                style=\"\r\n"
							+ "                  padding: 0px 30px 40px 30px;\r\n"
							+ "                  border-radius: 0px 0px 4px 4px;\r\n"
							+ "                  color: #666666;\r\n"
							+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
							+ "                  font-size: 18px;\r\n"
							+ "                  font-weight: 400;\r\n"
							+ "                  line-height: 25px;\r\n"
							+ "                \"\r\n"
							+ "              >\r\n"
							+ "                <p style=\"margin: 0\">Cheers,<br />OnlyFriends Team</p>\r\n"
							+ "              </td>\r\n"
							+ "            </tr>\r\n"
							+ "          </table>\r\n"
							+ "        </td>\r\n"
							+ "      </tr>\r\n"
							+ "      <tr>\r\n"
							+ "        <td\r\n"
							+ "          bgcolor=\"#f4f4f4\"\r\n"
							+ "          align=\"center\"\r\n"
							+ "          style=\"padding: 30px 10px 0px 10px\"\r\n"
							+ "        >\r\n"
							+ "          <table\r\n"
							+ "            border=\"0\"\r\n"
							+ "            cellpadding=\"0\"\r\n"
							+ "            cellspacing=\"0\"\r\n"
							+ "            width=\"100%\"\r\n"
							+ "            style=\"max-width: 600px\"\r\n"
							+ "          >\r\n"
							+ "            <tr>\r\n"
							+ "              <td\r\n"
							+ "                bgcolor=\"#FFECD1\"\r\n"
							+ "                align=\"center\"\r\n"
							+ "                style=\"\r\n"
							+ "                  padding: 30px 30px 30px 30px;\r\n"
							+ "                  border-radius: 4px 4px 4px 4px;\r\n"
							+ "                  color: #666666;\r\n"
							+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
							+ "                  font-size: 18px;\r\n"
							+ "                  font-weight: 400;\r\n"
							+ "                  line-height: 25px;\r\n"
							+ "                \"\r\n"
							+ "              >\r\n"
							+ "                <h2\r\n"
							+ "                  style=\"\r\n"
							+ "                    font-size: 20px;\r\n"
							+ "                    font-weight: 400;\r\n"
							+ "                    color: #111111;\r\n"
							+ "                    margin: 0;\r\n"
							+ "                  \"\r\n"
							+ "                >\r\n"
							+ "                  Need more help?\r\n"
							+ "                </h2>\r\n"
							+ "                <p style=\"margin: 0\">\r\n"
							+ "                  <a href=\"#\" target=\"_blank\" style=\"color: #ffa73b\"\r\n"
							+ "                    >We&rsquo;re here to help you out</a\r\n"
							+ "                  >\r\n"
							+ "                </p>\r\n"
							+ "              </td>\r\n"
							+ "            </tr>\r\n"
							+ "          </table>\r\n"
							+ "        </td>\r\n"
							+ "      </tr>\r\n"
							+ "      <tr>\r\n"
							+ "        <td bgcolor=\"#f4f4f4\" align=\"center\" style=\"padding: 0px 10px 0px 10px\">\r\n"
							+ "          <table\r\n"
							+ "            border=\"0\"\r\n"
							+ "            cellpadding=\"0\"\r\n"
							+ "            cellspacing=\"0\"\r\n"
							+ "            width=\"100%\"\r\n"
							+ "            style=\"max-width: 600px\"\r\n"
							+ "          >\r\n"
							+ "            <tr>\r\n"
							+ "              <td\r\n"
							+ "                bgcolor=\"#f4f4f4\"\r\n"
							+ "                align=\"left\"\r\n"
							+ "                style=\"\r\n"
							+ "                  padding: 0px 30px 30px 30px;\r\n"
							+ "                  color: #666666;\r\n"
							+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
							+ "                  font-size: 14px;\r\n"
							+ "                  font-weight: 400;\r\n"
							+ "                  line-height: 18px;\r\n"
							+ "                \"\r\n"
							+ "              >\r\n"
							+ "                <br />\r\n"
							+ "              </td>\r\n"
							+ "            </tr>\r\n"
							+ "          </table>\r\n"
							+ "        </td>\r\n"
							+ "      </tr>\r\n"
							+ "    </table>\r\n"
							+ "  </body>\r\n"
							+ "</html>\r\n"
							+ "";
					
					helper.setText(htmlMsg, true); // Use this or above line.
					
					
					System.out.println("111:" + orderDetails.getPaymentId());
					helper.setTo(memberEmail); //寄給誰
					helper.setSubject("Welcome OnlyFriends");
					helper.setFrom("onlyfriendsteam29@gmail.com");
					sender.send(mimeMessage);
					System.out.println("寄了一封信到"+memberEmail);
					}catch(Exception e) {
						System.out.println(e);
					}
				
			
				request.getSession().removeAttribute("cartlist");
				   
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
