package of.paypal.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.OAuthTokenCredential;
import com.paypal.base.rest.PayPalRESTException;

@Service
public class PaypalService {
	
	public Map<String, String> paypalSdkConfig() {
		Map<String, String> configMap = new HashMap<>();
		configMap.put("mode","sandbox");
		return configMap;
	}
	public OAuthTokenCredential oAuthTokenCredential() {
		return new OAuthTokenCredential("AftigsFKCM2v_kM3eOi1nnNVwL9SmIFmnWqg4ewxi1MrG9jeXPoEw2xWTSsfyn72gaFq0UKDh6QFIiFR","EDZ1Zb_-NgnVLQBedPD_Hgx-fSXn3xSOjsb-mqhAQI9tH05LCD-qJYqYdYJVDfxpsVHUP0NZG_IJe9q1", paypalSdkConfig());
	}
	public APIContext apiContext() throws PayPalRESTException {
		APIContext context = new APIContext(oAuthTokenCredential().getAccessToken());
		context.setConfigurationMap(paypalSdkConfig());
		return context;
	}
	
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

		Payment payment = new Payment();
		Payer payer = new Payer();
		payer.setPaymentMethod(method.toString());
		
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
		String b = apiContext().getRequestId();
		System.out.println("b"+b);
		return payment.create(apiContext());
	}
	
	public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException{
		Payment payment = new Payment();
		payment.setId(paymentId);
		PaymentExecution paymentExecute = new PaymentExecution();
		paymentExecute.setPayerId(payerId);
		String d = apiContext().getRequestId();
		System.out.println("d"+d);
		return payment.execute(apiContext(), paymentExecute);
	}

}
