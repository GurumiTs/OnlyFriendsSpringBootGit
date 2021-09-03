package of.security.oauth2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.common.model.Users;
import of.common.model.UsersService;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;
import of.member.model.Member;
import of.member.model.MemberService;

@SessionAttributes(names = { "errorMsg" })
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

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
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.out.println("login error handler");
		String username = request.getParameter("username");

//		System.out.println(username);
//		String userType = null;
//		try {
//			 userType = usersService.findByEmail(username).getUsersRole();
//		}catch(Exception e){
//			request.getSession().setAttribute("errorMsg", "帳號或密碼錯誤");
//			response.sendRedirect(request.getContextPath()+"/login?error");
//		}
//		
//
//		if (userType.equals("member")) {
//			Member member = memberService.findByMemberAccount(username);	
//			if(member.getMemberAuth() == 0 && member.getMemberEmailCheck() == 1) {
//				request.getSession().setAttribute("errorMsg", "該帳號已被封鎖");
//			}
//			else if(member.getMemberAuth() == 1 && member.getMemberEmailCheck() == 0) {
//				request.getSession().setAttribute("errorMsg", "尚未通過信箱驗證");
//			}
//			else if(member.getMemberAuth() == 0 && member.getMemberEmailCheck() == 0) {
//				request.getSession().setAttribute("errorMsg", "偵測到異常行為請聯絡客服");
//			}
//			else {
//				
//			}
//			
//		}
//
//		//request.setAttribute("errorMsg", "登入發生錯誤");
//	
//		System.out.println(exception.getClass());
//		System.out.println(exception.getStackTrace());
//		System.out.println("error msg"+exception.getMessage());
		if (exception.getClass().isAssignableFrom(InternalAuthenticationServiceException.class)) {
			System.out.println("帳號或密碼錯誤");
			request.getSession().setAttribute("errorMsg", "帳號或密碼錯誤");
		} else if (exception.getClass().isAssignableFrom(DisabledException.class)) {
			System.out.println("該帳號已被封鎖");
			request.getSession().setAttribute("errorMsg", "該帳號已被封鎖，若有疑慮請洽線上客服");
		} else if (exception.getClass().isAssignableFrom(CredentialsExpiredException.class)) {
			System.out.println("尚未通過信箱驗證");
			request.getSession().setAttribute("errorMsg", "尚未通過信箱驗證");
		}
		response.sendRedirect(request.getContextPath() + "/login?error");

	}

}