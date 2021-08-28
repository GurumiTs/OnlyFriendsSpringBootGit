package of.security.oauth2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

 
public class CustomLoginFilter extends UsernamePasswordAuthenticationFilter {
	
	public CustomLoginFilter(String loginURL, String httpMethod) {
		setUsernameParameter("username");
		super.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher(loginURL,httpMethod));
	}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		String recaptchaFromResponse = request.getParameter("g-recaptcha-response");
		System.out.println("Before proccessing spring security.......");
		ReCaptchaV3Handler handler = new ReCaptchaV3Handler();
		float score = handler.verify(recaptchaFromResponse);
		
		if(score <0.5) {
			try {
				System.out.println("score < 0.5");
				request.getRequestDispatcher("/login").forward(request, response);
			} catch (ServletException | IOException e) {			
				e.printStackTrace();
			} 
		}
		
		return super.attemptAuthentication(request, response); 
	}
	
	
}
