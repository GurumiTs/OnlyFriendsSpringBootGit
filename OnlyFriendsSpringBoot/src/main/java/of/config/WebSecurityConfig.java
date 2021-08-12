package of.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import of.common.model.AuthUserDetailsService;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthUserDetailsService userDetailsService;
	
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
		.antMatchers(HttpMethod.GET, "/emp**").hasRole("employee")
		.antMatchers(HttpMethod.GET).permitAll()
		.antMatchers(HttpMethod.POST, "/emp**").hasRole("employee")
		.antMatchers(HttpMethod.POST).permitAll()
		.anyRequest().authenticated()
		.and()
		.rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")
		.and()
		.csrf().disable()
		.formLogin()
		.loginPage("/login")
		.defaultSuccessUrl("/");
	}

}
