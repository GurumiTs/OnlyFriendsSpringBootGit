package of.security.oauth2;

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
		System.out.println("Before proccessing spring security.......");
		return super.attemptAuthentication(request, response);
	}
	
	
}
