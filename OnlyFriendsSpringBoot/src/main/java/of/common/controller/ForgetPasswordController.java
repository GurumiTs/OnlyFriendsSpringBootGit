package of.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.common.model.Users;
import of.common.model.UsersService;
import of.common.util.BCrypt;
import of.common.util.GetRandomPwd;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;

@Controller
@SessionAttributes(names = { "successMsg", "errorMsg" })
public class ForgetPasswordController {
	@Autowired
	private EmployeeService empService;
	@Autowired
	private Employee employee;
	@Autowired
	private Users users;
	@Autowired
	private UsersService usersService;
	@Autowired
	private JavaMailSender sender;

	@RequestMapping(path = "/sendingnewpassword", method = RequestMethod.GET)
	public String forgetpasswordEntry() {
		return "commonpages/sendingnewpassword";
	}
	
	@RequestMapping(path = "/setnewpasswordform", method = RequestMethod.GET)
	public String setNewPasswordForm() {
		return "commonpages/setnewpasswordform";
	}

	@RequestMapping(path = "/sendingnewpasswordform.controller", method = RequestMethod.POST)
	public String sendingNewPasswordFormController(HttpServletRequest request) {
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		String scode = (String) request.getSession().getAttribute("code");
		if (code.equals(scode)) {
			request.setAttribute("email", email);
			return "forward:/sendingnewpasswordmail";
		}
		return "login";
	}

	@RequestMapping(path = "/sendingnewpasswordmail", method = RequestMethod.POST)
	public String sendingNewPasswordMail(HttpServletRequest request,Model model) {

		try {
			String email = (String) request.getAttribute("email");
			Users users = usersService.findByEmail(email);
			String randomPassword = GetRandomPwd.getRandomPassword();
			String hashRandomPassword = BCrypt.hashpw(randomPassword, BCrypt.gensalt());
			users.setUsersPassword(hashRandomPassword);
			usersService.update(users);
			SimpleMailMessage mail = new SimpleMailMessage();
			mail.setTo(email);
			mail.setFrom("onlyfriendseeit29@gmail.com");
			mail.setSubject("New Password");
			mail.setText("NewPassword:" + randomPassword + "\n" + "http://localhost:8080/OnlyFriends/setnewpasswordform"
					+ "?email=" + email);
			sender.send(mail);
			return "commonpages/sendingnewpasswordsuccess";
		} catch (Exception e) {
			model.addAttribute("errorMsg", "send new password failed");
			return "login";
		
		}

	}
	
	@RequestMapping(path="setnewpasswordcontroller")
	public String setNewPasswordFormController(HttpServletRequest request,Model model) {
		String email = request.getParameter("email");
		String oldPassword = request.getParameter("oldPwd");
		String newPassword = request.getParameter("updatePwd1");
		
		Users users = usersService.findByEmail(email);
		String oldHashPassword = users.getUsersPassword();
		boolean checkPasswordStatus = BCrypt.checkpw(oldPassword, oldHashPassword);
		if (checkPasswordStatus == true) {
			String newHashPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
			users.setUsersPassword(newHashPassword);
			usersService.update(users);
			model.addAttribute("successMsg", "update new password success");
			return "login" ;
		}
		model.addAttribute("errorMsg", "update new password failed");
		return "login";
	}

}
