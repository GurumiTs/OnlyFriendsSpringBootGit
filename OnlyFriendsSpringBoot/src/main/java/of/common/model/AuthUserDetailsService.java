package of.common.model;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.anji.captcha.service.CaptchaService;

import of.emp.model.Employee;
import of.emp.model.EmployeeService;
import of.member.model.Member;
import of.member.model.MemberService;

@Service("userDetailsService")
public class AuthUserDetailsService implements UserDetailsService{
	
	@Autowired
	private UsersService usersService;
	@Autowired
	private Users users;
	@Autowired 
	private MemberService memberService;
	@Autowired
	private Member member;
	@Autowired
	private EmployeeService empService;
	@Autowired
	private Employee employee;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
		System.out.println("username"+username);
		Users users = usersService.loginCheck(username);

		boolean emaildisable = true ;
		boolean authdisable = true ; 
		if (users.getUsersRole().equals("employee")) {
			Employee employee = empService.findByEmpEmail(username);
			int intemaildisable = employee.getEmpEmailCheck();
			int intauthdisable = employee.getEmpAuthority();
			if(intemaildisable == 0) {
				emaildisable = true;
			}else {
				emaildisable = false;
			}
			if(intauthdisable == 0) {
				authdisable = true;
			}else {
				authdisable = false;
			}
			
		}
		
		
		if (users.getUsersRole().equals("member")) {
			Member member = memberService.findByMemberAccount(username);
			int intemaildisable = member.getMemberEmailCheck();
			int intauthdisable = member.getMemberAuth();
			if(intemaildisable == 0) {
				emaildisable = true;
			}else {
				emaildisable = false;
			}
			if(intauthdisable == 0) {
				authdisable = true;
			}else {
				authdisable = false;
			}
			
		}
	
		UserDetails userDetails = User.builder()
                .username(users.getUsersEmail())
                .password(users.getUsersPassword()) 
                .roles(users.getUsersRole())
                .credentialsExpired(emaildisable)
                .disabled(authdisable)
                .build();
        
        return userDetails;
	}


}
