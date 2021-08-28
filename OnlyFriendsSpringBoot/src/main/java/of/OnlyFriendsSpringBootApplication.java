package of;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

@SpringBootApplication
@ServletComponentScan
@EnableGlobalMethodSecurity(securedEnabled = true)
public class OnlyFriendsSpringBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnlyFriendsSpringBootApplication.class, args);
	}

}
