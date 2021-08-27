package of.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class PaypalConfig {
	
	@Value("${paypal.client.id}")
	private String clientId;
	private String clientSecret;
	private String mode;

}
