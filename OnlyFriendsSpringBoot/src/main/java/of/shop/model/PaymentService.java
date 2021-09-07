package of.shop.model;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import com.paypal.api.payments.*;
import com.paypal.base.rest.*;

public class PaymentService {
	
	@Autowired
	private APIContext apiContext;
 
    public String authorizePayment(OrderDetails orderDetail)        
            throws PayPalRESTException {       
 
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
 
        Payment approvedPayment = requestPayment.create(apiContext);
 
        return getApprovalLink(approvedPayment);
 
    }
     
    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
        
        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("William")
        		 .setLastName("Peterson")
        		 .setEmail("william.peterson@company.com");
        
        payer.setPayerInfo(payerInfo);
        
        return payer;
        
    }
     
    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost/PayPalTest/cancel.html");
        redirectUrls.setReturnUrl("http://localhost/PayPalTest/review_payment");
        
        return redirectUrls;
    }
    
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
    	return Payment.get(apiContext, paymentId);
    }
    
    public Payment executePayment(String paymentId,String payerId) throws PayPalRESTException {
    	PaymentExecution paymentExecution = new PaymentExecution();
    	paymentExecution.setPayerId(payerId);
    	
    	Payment payment = new Payment().setId(paymentId);
    	
    	return payment.execute(apiContext, paymentExecution);
    	
    }
     
    private List<Transaction> getTransactionInformation(OrderDetails orderDetail) {
    	Details details=new Details();
    	details.setSubtotal(orderDetail.getSubtotal());
    	
    	Amount amount=new Amount();
    	amount.setCurrency("USD");
    	amount.setTotal(orderDetail.getTotal());
    	amount.setDetails(details);
    	
    	Transaction transaction=new Transaction();
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
     
    private String getApprovalLink(Payment approvedPayment) {
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
