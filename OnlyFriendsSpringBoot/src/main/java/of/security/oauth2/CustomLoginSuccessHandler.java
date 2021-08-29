package of.security.oauth2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.DefaultSavedRequest;
import org.springframework.stereotype.Component;

import com.anji.captcha.model.common.ResponseModel;
import com.anji.captcha.model.vo.CaptchaVO;
import com.anji.captcha.service.CaptchaService;

import of.common.model.Users;
import of.common.model.UsersService;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;
import of.member.model.Member;
import of.member.model.MemberService;

@Component
public class CustomLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{

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
	@Autowired
	private CaptchaService captchaService;
	
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("hi im success handler");
		
//		String captchaVerification = request.getParameter("captchaVerification");
//		System.out.println(captchaVerification);
//		 CaptchaVO captchaVO = new CaptchaVO();
//	     captchaVO.setCaptchaVerification(captchaVerification);
//	     ResponseModel rs= captchaService.verification(captchaVO);
//	     System.out.println("rs issuccess:"+rs.isSuccess());
//	        if(rs.isSuccess() == false){
//	        	System.out.println("hi ajcaptcha ");
//	            //验证码校验失败，返回信息告诉前端
//	            //repCode  0000  无异常，代表成功
//	            //repCode  9999  服务器内部异常
//	            //repCode  0011  参数不能为空
//	            //repCode  6110  验证码已失效，请重新获取
//	            //repCode  6111  验证失败
//	            //repCode  6112  获取验证码失败,请联系管理员
//	        }
	        
		
		String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();			
		String userType = usersService.findByEmail(currentUserName).getUsersRole();
		if (userType.equals("employee")) {
			Employee employee = empService.findByEmpEmail(currentUserName);
			if(employee.getEmpEmailCheck() == 0) {
				request.getSession().setAttribute("errorMsg","please verify email");
				SecurityContextHolder.clearContext();
			}
			request.getSession().setAttribute("employee", "employee");
			request.getSession().setAttribute("personalinfo",employee);

		}
		if (userType.equals("member")) {
			request.getSession().setAttribute("member", "member");
			Member member = memberService.findByMemberAccount(currentUserName);
			request.getSession().setAttribute("personalinfo",member);
			
		}
		
		DefaultSavedRequest defaultSavedRequest = (DefaultSavedRequest) request.getSession().getAttribute("SPRING_SECURITY_SAVED_REQUEST");
        if(defaultSavedRequest != null){
            getRedirectStrategy().sendRedirect(request, response, defaultSavedRequest.getRedirectUrl());
        }else{
            super.onAuthenticationSuccess(request, response, authentication);
        }
		
		super.onAuthenticationSuccess(request, response, authentication);
	}

}
