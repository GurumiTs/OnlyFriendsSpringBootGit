package of.security.oauth2;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class ReCaptchaV3Handler {
	
	private String recaptchaSecret = "6Ld_JiIcAAAAAFu9Xp7Roes1IGvx91D-JGpUdnZb";
	private String recaptchaServerURL = "https://www.google.com/recaptcha/api/siteverify"; 
	
	public float verify(String recaptchaFormResponse) {
		System.out.println("recaptchaV3 handler");
		System.out.println("recaptcha response:"+recaptchaFormResponse);
		
		HttpHeaders headers =  new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		MultiValueMap<String,String> map = new LinkedMultiValueMap<String, String>();
		map.add("secret",recaptchaSecret);
		map.add("response", recaptchaFormResponse);
	
		HttpEntity<MultiValueMap<String,String>> request = new HttpEntity<>(map,headers);
	
		RestTemplate restTemplete = new RestTemplate();
		ReCaptchaResponse response =  restTemplete.postForObject(recaptchaServerURL, request,ReCaptchaResponse.class);
		
		System.out.println("recaptcha response:\n");
		System.out.println("success:"+response.isSuccess());
		System.out.println("action:"+response.getAction());
		System.out.println("hostname:"+response.getHostname());
		System.out.println("score:"+response.getScore());
		System.out.println("chanllenge timestamp"+response.getChallenge_ts());
	
		if(response.getErrorCodes() != null) {
			System.out.println("ErrorCodes:");
			for(String errorCode : response.getErrorCodes()) {
			System.out.println("\t"+errorCode);
			}
		}
		
		return response.getScore();
	
	}
	
}
