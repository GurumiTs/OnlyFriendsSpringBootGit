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
		
		
		CustomOAuth2User oauth2UserAuthority = (CustomOAuth2User)authentication.getPrincipal();
		String email = oauth2UserAuthority.getEmail();
		String name =oauth2UserAuthority.getGivenName();
		String id = oauth2UserAuthority.getSub();
		//all info
		//System.out.println(oauth2UserAuthority.getAttributes());
	

		if(usersService.checkEmail(id)  == false) {
			System.out.println("該用戶不存在");
			
			users.setUsersEmail(id);
			users.setUsersRole("member");		
			usersService.insert(users);			
			
			member.setMemberAuth(1);
			member.setMemberEmailCheck(1);
			member.setMemberAccount(id);
			member.setMemberEmail(email);
			member.setMemberName(name);
			member.setSwipeTime("3");
			member.setSwipeDate("0");
			member.setMemberPic("images/smallicon/nonephoto2.svg");
			memberService.insert(member);	
			request.getSession().setAttribute("member", "member");
			Member member = memberService.findByMemberAccount(id);
			request.getSession().setAttribute("personalinfo",member);
			request.getSession().setAttribute("googlelogin","googlelogin");
				
		}
		else {
			request.getSession().setAttribute("member", "member");
			Member member = memberService.findByMemberAccount(id);
			request.getSession().setAttribute("personalinfo",member);
			request.getSession().setAttribute("googlelogin","googlelogin");
			System.out.println("該用戶已存在");	
		}
				
		super.onAuthenticationSuccess(request, response, authentication);
	}

}
