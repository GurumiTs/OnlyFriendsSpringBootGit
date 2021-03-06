package of.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import of.common.model.AuthUserDetailsService;
import of.security.oauth2.CustomAuthenticationFailureHandler;
import of.security.oauth2.CustomLoginFilter;
import of.security.oauth2.CustomLoginSuccessHandler;
import of.security.oauth2.CustomOAuth2UserService;
import of.security.oauth2.OAuth2LoginSuccessHandler;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthUserDetailsService userDetailsService;	
	@Autowired
	private CustomOAuth2UserService oAuth2UserService;
	@Autowired
	private OAuth2LoginSuccessHandler oAuth2LoginSuccessHandler;
	@Autowired
	private CustomLoginSuccessHandler customLoginSuccessHandler;

	@Autowired
	private DataSource dataSource;
//	@Autowired
//	private FilterSecurityInterceptor filterSecurityInterceptor;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		  .userDetailsService(userDetailsService)
		  .passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()
		.antMatchers("/oauth2/**").permitAll()
		.antMatchers("/emp**").hasRole("employee")
		.anyRequest().permitAll()
		.and()
//		.addFilterBefore(getCustomLoginFilter(),CustomLoginFilter.class)
		.csrf().disable()
		.formLogin()
			.loginPage("/login")
			.successHandler(customLoginSuccessHandler) 
			.failureHandler(customAuthenticationFailureHandler())
			.and()
			.rememberMe().tokenRepository(persistentTokenRepository())
			.tokenValiditySeconds(8400)			
			//.userDetailsService(userDetailsService) //???????????????????????????????????????
		.and()
		.oauth2Login()
			.loginPage("/login")
			.userInfoEndpoint()
			.userService(oAuth2UserService)
			.and()
			.successHandler(oAuth2LoginSuccessHandler)
		.and().logout().invalidateHttpSession(true)
        .clearAuthentication(true).logoutSuccessUrl("/login?logout").deleteCookies("JSESSIONID").permitAll();
}
		
		 //http.addFilterAt(filterSecurityInterceptor, FilterSecurityInterceptor.class);
	
	
    @Bean
    public AuthenticationFailureHandler customAuthenticationFailureHandler() {
        return new CustomAuthenticationFailureHandler();
    }

	
	@Bean
	public AuthenticationSuccessHandler successHandler() {
	    SimpleUrlAuthenticationSuccessHandler handler = new SimpleUrlAuthenticationSuccessHandler();
	    handler.setUseReferer(true);
	    return handler;
	}
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
		jdbcTokenRepository.setDataSource(dataSource);
		//jdbcTokenRepository.setCreateTableOnStartup(true);
		return jdbcTokenRepository;
	}
	
	
	private CustomLoginFilter getCustomLoginFilter() throws Exception {
		CustomLoginFilter filter = new CustomLoginFilter("/login","POST");
		filter.setAuthenticationManager(authenticationManager());
		filter.setAuthenticationFailureHandler(new AuthenticationFailureHandler() {
			
			@Override
			public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
					AuthenticationException exception) throws IOException, ServletException {
				response.sendRedirect("login?error");
				
			}
		});
		return filter;
	}
}
