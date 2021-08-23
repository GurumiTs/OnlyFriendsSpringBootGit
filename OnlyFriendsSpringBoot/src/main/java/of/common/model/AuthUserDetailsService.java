package of.common.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("userDetailsService")
public class AuthUserDetailsService implements UserDetailsService{
	
	@Autowired
	private UsersService usersService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users users = usersService.loginCheck(username);
		UserDetails userDetails = User.builder()
                .username(users.getUsersEmail())
                .password(users.getUsersPassword()) 
                .roles(users.getUsersRole())
                .build();
        
        return userDetails;
	}


}
