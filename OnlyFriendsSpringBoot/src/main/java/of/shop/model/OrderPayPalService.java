package of.shop.model;


	import java.math.BigDecimal;
	import java.math.RoundingMode;
	import java.util.ArrayList;
	import java.util.List;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Service;

	import com.paypal.api.payments.Amount;
	import com.paypal.api.payments.Details;
	import com.paypal.api.payments.Item;
	import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
	import com.paypal.api.payments.Payment;
	import com.paypal.api.payments.PaymentExecution;
	import com.paypal.api.payments.RedirectUrls;
	import com.paypal.api.payments.Transaction;
	import com.paypal.base.rest.APIContext;
	import com.paypal.base.rest.PayPalRESTException;

	@Service
	public class OrderPayPalService {
		
		@Autowired
		private APIContext apiContext;
		
		
		public Payment createPayment(
				Double total, 
				String currency, 
				String method,
				String intent,
				String description, 
				String cancelUrl, 
				String successUrl,
				OrderDetails orderDetails) throws PayPalRESTException{
			Amount amount = new Amount();
			amount.setCurrency(currency);
			total = new BigDecimal(total).setScale(2, RoundingMode.HALF_UP).doubleValue();
			amount.setTotal(String.format("%.2f", total));

			Transaction transaction = new Transaction();
			transaction.setDescription(description);
			transaction.setAmount(amount);

			List<Transaction> transactions = getTransactionInformation(orderDetails);
			transactions.add(transaction);

			Payer payer = new Payer();
			payer.setPaymentMethod(method.toString());

			Payment payment = new Payment();
			payment.setIntent(intent.toString());
			payment.setPayer(payer);  
			payment.setTransactions(transactions);
			RedirectUrls redirectUrls = new RedirectUrls();
			redirectUrls.setCancelUrl(cancelUrl);
			redirectUrls.setReturnUrl(successUrl);
			payment.setRedirectUrls(redirectUrls);

			return payment.create(apiContext);
		}
		
		private List<Transaction> getTransactionInformation(OrderDetails orderDetail) {
	    	Details details=new Details();
	    	details.setSubtotal(orderDetail.getSubtotal());
	    	
	    	Amount amount=new Amount();
	    	amount.setCurrency("USD");
	    	amount.setTotal(orderDetail.getTotal());
	    	amount.setDetails(details);
	    	
	    	Transaction transaction=new Transaction();
	    	transaction.setAmount(amount);
	    	transaction.setDescription(orderDetail.getProductName());
	    	
	    	ItemList itemList=new ItemList();
	    	List<Item> items=new ArrayList<Item>();
	    	
	    	Item item =new Item();
	    	item.setCurrency("USD")
	    		.setName(orderDetail.getProductName())
	    		.setPrice(orderDetail.getSubtotal())
	    		.setQuantity("1");
	    	
	    	items.add(item);
	    	itemList.setItems(items);
	    	transaction.setItemList(itemList);
	    	
	    	List<Transaction> listTransactions =new ArrayList<Transaction>();
	    	listTransactions.add(transaction);
	    	
	    	return listTransactions;
	    }
		 
		
		public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException{
			Payment payment = new Payment();
			payment.setId(paymentId);
			PaymentExecution paymentExecute = new PaymentExecution();
			paymentExecute.setPayerId(payerId);
			return payment.execute(apiContext, paymentExecute);
		}
		
		 public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
		    	return Payment.get(apiContext, paymentId);
		    }
		
		private String getApproval(Payment approvedPayment) {
	        List<Links> links=approvedPayment.getLinks();
	        String approvalLink =null;
	        
	        for(Links link : links) {
	        	if (link.getRel().equalsIgnoreCase("approval_url")) {
	        		approvalLink = link.getHref();
	        	}
	        }
	        return approvalLink;
	    }

}
