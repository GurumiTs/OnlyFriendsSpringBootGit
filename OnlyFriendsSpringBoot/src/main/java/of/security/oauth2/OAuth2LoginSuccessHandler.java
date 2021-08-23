package of.security.oauth2;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2UserAuthority;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import of.common.model.Users;
import of.common.model.UsersService;
import of.member.model.Member;
import of.member.model.MemberService;

@Component
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{
	
	@Autowired
	private UsersService usersService;
	@Autowired
	private Users users;
	@Autowired 
	private MemberService memberService;
	@Autowired
	private Member member;
	

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		String name = authentication.getName();
		String info = authentication.getPrincipal().toString();
		//OAuth2UserAuthority oauth2UserAuthority = (OAuth2UserAuthority)authentication.getAuthorities();
		//System.out.println(oauth2UserAuthority);
		System.out.println(info);
		if(usersService.checkEmail(name)  == false) {
			System.out.println("該用戶不存在");
			users.setUsersEmail(name);
			users.setUsersRole("member");		
			usersService.insert(users);
			
			member.setMemberName("Users");
			member.setMemberAccount(name);
			member.setSwipeTime("3");
			member.setSwipeDate("0");
			member.setMemberPic("images/smallicon/nonephoto2.svg");
			memberService.insert(member);		
		}
		else {
			System.out.println("該用戶已存在");			
		}
		
		
				
		super.onAuthenticationSuccess(request, response, authentication);
	}

}
