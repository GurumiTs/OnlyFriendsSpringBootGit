package of.common.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.common.model.UsersService;
import of.common.util.BCrypt;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;
import of.member.model.Member;
import of.member.model.MemberService;

@Controller
@SessionAttributes(names = {"user","membertype","employeetype"})
public class LoginController {
	@Autowired
	private EmployeeService empService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private Employee employee;
	@Autowired
	private Member member;

	@RequestMapping(path = "/login.controller", method = RequestMethod.POST)
	public String loginController(@RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "password", required = false) String password,
			@RequestParam(name = "autologin", required = false) String autologin, Model model,
			HttpServletResponse response) {

		int userType = 3;
		if (email == null || email.length() == 0 || password == null || password.length() == 0) {
			model.addAttribute("errorMsg", "can't empty!");
			return "login";
		}
		try {
			userType = usersService.findByEmail(email).getUsertype();
		} catch (Exception e) {
			model.addAttribute("errorMsg", "something error!");
			return "login";
		}
		if (userType == 1) {
			employee = empService.findByEmpEmail(email);
			boolean checkPasswordStatus = BCrypt.checkpw(password, employee.getEmpPassword());
			if (checkPasswordStatus == true && employee.getEmpEmailCheck() > 0) {
				if (autologin != null) {
					Cookie cookie = new Cookie("autologin", email + "&" + employee.getEmpPassword() + "&" + userType);
					cookie.setMaxAge(3600);
					response.addCookie(cookie);
				}
				model.addAttribute("user",employee);
				String[] type = {"employee"} ;
				model.addAttribute("employeetype",type);
				return "employeepages/employee";
			} else if (checkPasswordStatus == true && employee.getEmpEmailCheck() == 0) {
				model.addAttribute("errorMsg", "please verify mail!");
				return "login";
			}

		}
		if (userType == 0) {
			member = memberService.findByMemberEmail(email);
			boolean checkPasswordStatus = BCrypt.checkpw(password, member.getMemberPassword());
			if (checkPasswordStatus == true && member.getMemberEmailCheck() > 0) {
				if (autologin != null) {
					Cookie cookie = new Cookie("autologin", email + "&" + member.getMemberPassword() + "&" + userType);
					cookie.setMaxAge(3600);
					response.addCookie(cookie);
				}
				model.addAttribute("user",member);
				String[] type = {"member"} ;
				model.addAttribute("membertype",type);
				return "index"; // memberpage
			} else if (checkPasswordStatus == true && member.getMemberEmailCheck() == 0) {
				model.addAttribute("errorMsg", "please verify mail!");
				return "login";
			}
		}
		model.addAttribute("errorMsg", "something error!");
		return "login";
	}
}
