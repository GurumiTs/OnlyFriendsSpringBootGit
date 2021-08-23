package of.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import of.common.model.AuthUserDetailsService;
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
//		.antMatchers("/member**").hasAnyAuthority("member,ROLE_USER")
		.anyRequest().permitAll()
		.and()
		.csrf().disable()
		.formLogin()
			.loginPage("/login")
			.successHandler(customLoginSuccessHandler)
			.and()
			.rememberMe().tokenRepository(persistentTokenRepository())
			.tokenValiditySeconds(8400)
			.userDetailsService(userDetailsService) //將使用者資訊存入資料庫表格
		.and()
		.oauth2Login()
			.loginPage("/login")
			.userInfoEndpoint()
			.userService(oAuth2UserService)
			.and()
			.successHandler(oAuth2LoginSuccessHandler)
		.and()
		.logout().permitAll();	
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

//
//	create table persistent_logins (
//			username varchar(64) not null,
//			series varchar(64) primary key,
//			token varchar(64) not null,
//			last_used   timestamp  not null
//
//		);	
//NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
}
