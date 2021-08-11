package of.emp.controller;

import java.io.File;
import java.util.List;

import javax.mail.Message;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import of.common.model.Users;
import of.common.model.UsersService;
import of.common.util.BCrypt;
import of.common.util.GetRandomPwd;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;

@Controller
@RequestMapping(path = "/employee")
public class EmployeeSignupController {

	@Autowired
	private EmployeeService empService;
	@Autowired
	private Employee employee;
	@Autowired
	private UsersService usersService;
	@Autowired
	private Users users;
	@Autowired
	private JavaMailSender sender;

	@RequestMapping(path = "/signupemp", method = RequestMethod.GET)
	public String signupempEntry() {
		return "employeepages/empsignup";
	}

	@RequestMapping(path = "/emailverifysuccess", method = RequestMethod.GET)
	public String emailverifysuccess() {
		return "emailverifysuccess";
	}

	@RequestMapping(path = "/emailverifyfailed", method = RequestMethod.GET)
	public String emailverifyfailed() {
		return "emailverifyfailed";
	}

	@RequestMapping(path = "/signupemp.controller", method = RequestMethod.POST)
	public String signupEmployee(@RequestParam(name = "empEmail", required = false) String empEmail,
			@RequestParam(name = "empAcc", required = false) String empAcc,
			@RequestParam(name = "empName", required = false) String empName,
			@RequestParam(name = "empPwd1", required = false) String empPwd1,
			@RequestParam(name = "empBday", required = false) String empBday,
			@RequestParam(name = "empPic", required = false) MultipartFile multipartFile,
			@RequestParam(name = "empAddress", required = false) String empAddress,
			@RequestParam(name = "county", required = false) String county,
			@RequestParam(name = "district", required = false) String district,
			@RequestParam(name = "zipcode", required = false) String zipcode,
			@RequestParam(name = "empAuth", required = false) int empAuth,
			@RequestParam(name = "empDeptNum", required = false) int empDeptNum, HttpServletRequest request,
			Model model) {

		try {
			String empPassword = BCrypt.hashpw(empPwd1, BCrypt.gensalt());
			employee.setEmpEmail(empEmail);
			employee.setEmpAccount(empAcc);
			employee.setEmpName(empName);
			employee.setEmpBday(empBday);
			employee.setEmpAddress(empAddress);
			employee.setEmpCounty(county);
			employee.setEmpDistrict(district);
			employee.setEmpZipcode(zipcode);
			employee.setEmpAuthority(empAuth);
			employee.setDeptNum(empDeptNum);
			employee.setEmpCreateTime(System.currentTimeMillis());

			// pic
			String fileName = multipartFile.getOriginalFilename();
			String path1 = request.getServletContext().getRealPath("/images");
			String filePath =  "C:/FinalProject/OnlyFriendsSpringBootGit/OnlyFriendsSpringBoot/src/main/resources/static/images/empPic/" + fileName;
			File saveFile = new File(filePath);
			multipartFile.transferTo(saveFile);
			employee.setEmpPic("images\\empPic\\" + fileName);
			empService.insert(employee);

			users.setUsersEmail(empEmail);
			users.setUsersPassword(empPassword);
			users.setUsersRole("employee");
			usersService.insert(users);
			//System.out.println("signupmail" + empEmail);
			request.setAttribute("email", empEmail);
			return "forward:/signupmail.controller";
		} catch (Exception e) {
			model.addAttribute("errorMsg", "signup employee failed");
			return "employeepages/empsignup";
		}

	}

	@RequestMapping(path = "/signupmail.controller", method = RequestMethod.POST)
	public String sendSignupMail(HttpServletRequest request, Model model) {
		try {
			String email = (String) request.getAttribute("email");
			Employee employee = empService.findByEmpEmail(email);
			String empEmailCheckNum = GetRandomPwd.getRandomPassword();
			employee.setEmpEmailCheckNum(empEmailCheckNum);
			empService.update(employee);
			SimpleMailMessage mail = new SimpleMailMessage();
			mail.setTo(email);
			mail.setFrom("onlyfriendseeit29@gmail.com");
			mail.setSubject("Verify Account");
			mail.setText("Click to verify:\n" + "http://localhost:8080/OnlyFriends/signupmailcheck" + "?email=" + email
					+ "&checknum=" + empEmailCheckNum);
			sender.send(mail);
			model.addAttribute("successMsg", "sending verify mail success!");
			return "employeepages/empsignup";
		} catch (Exception e) {
			model.addAttribute("errorMsg", "sending verify mail failed!");
			return "employeepages/empsignup";
		}

	}

	@RequestMapping(path = "signupmailcheck", method = RequestMethod.GET)
	public String checkAccountMail(HttpServletRequest request) {
		String email = request.getParameter("email");
		String empEmailCheckNum = request.getParameter("checknum");
		System.out.println(email);
		System.out.println(empEmailCheckNum);
		Employee employee = empService.findByEmpEmail(email);
		String checkNum = employee.getEmpEmailCheckNum();
		if (checkNum.equals(empEmailCheckNum)) {
			employee.setEmpEmailCheck(1);
			empService.update(employee);
			return "commonpages/emailverifysuccess";
		}

		return "commonpages/emailverifyfailed";
	}

}
