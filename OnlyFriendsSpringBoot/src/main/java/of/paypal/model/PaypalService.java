package of.paypal.model;

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
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

@Service
public class PaypalService {
	
	@Autowired
	private APIContext apiContext;

	public Payment createPayment(
			String total, 
			String currency, 
			String method,
			String intent,
			String description, 
			String cancelUrl, 
			String successUrl,
			ItemList itemlist,
			Details details) throws PayPalRESTException{
//		Amount amount = new Amount();
//		amount.setCurrency(currency);
//		total = new BigDecimal(total).setScale(2, RoundingMode.HALF_UP).doubleValue();
//		amount.setTotal(String.format("%.2f", total));
//
//		Transaction transaction = new Transaction();
//		transaction.setDescription(description);
//		transaction.setAmount(amount);
//		Item i1 = new Item("bottle","2","300","TWD");
//		Item i2 = new Item("wallet","3","600","TWD");
//		List<Item> listitem = new ArrayList<Item>();
//		listitem.add(i1);
//		listitem.add(i2);	
//		ItemList itemlist = new ItemList();
//		itemlist.setItems(listitem);
//		transaction.setItemList(itemlist);
//		
//
//		List<Transaction> transactions = new ArrayList<>();
//		transactions.add(transaction);
//		
//
//		Payer payer = new Payer();
//		payer.setPaymentMethod(method.toString());
//
//		Payment payment = new Payment();
//		payment.setIntent(intent.toString());
//		payment.setPayer(payer);  
//		payment.setTransactions(transactions);
		Payment payment = new Payment();
		Payer payer = new Payer();
		payer.setPaymentMethod(method.toString());
		
//		Item i1 = new Item("bottle","2","300","TWD");
//		Item i2 = new Item("wallet","3","600","TWD");
//		List<Item> listitem = new ArrayList<Item>();
//		listitem.add(i1);
//		listitem.add(i2);	
//		ItemList itemlist = new ItemList();
//		itemlist.setItems(listitem);
//		
//		Details details = new Details();
//		details.setShipping("100");
//		details.setTax("200");
//		details.setSubtotal("2400");
		
		Amount amount = new Amount();
		amount.setCurrency(currency);
		amount.setTotal(total);
		amount.setDetails(details);
		
		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		transaction.setItemList(itemlist);
		List<Transaction> transactions = new ArrayList<>();
		transactions.add(transaction);
		
		
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl(cancelUrl);
		redirectUrls.setReturnUrl(successUrl);
		
		payment.setRedirectUrls(redirectUrls);
		payment.setIntent(intent.toString());
		payment.setTransactions(transactions);
		payment.setPayer(payer);  
		return payment.create(apiContext);
	}
	
	public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException{
		Payment payment = new Payment();
		payment.setId(paymentId);
		PaymentExecution paymentExecute = new PaymentExecution();
		paymentExecute.setPayerId(payerId);
		return payment.execute(apiContext, paymentExecute);
	}

}
