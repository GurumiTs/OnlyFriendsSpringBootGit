package of.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.common.model.UsersService;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;
import of.member.model.Member;
import of.member.model.MemberService;

@Controller
@SessionAttributes(names = { "user", "member", "employee" })
public class MainEntryController {
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

	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String mainEntry(Model model) {
		try {
			String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();
			System.out.println(currentUserName);
			String userType = usersService.findByEmail(currentUserName).getUsersRole();
			if (userType.equals("employee")) {
				model.addAttribute("employee", "employee");

			}
			if (userType.equals("member")) {
				model.addAttribute("member", "member");
			}
			return "index";
		} catch (Exception e) {
			return "index";
		}

	}

	@RequestMapping(path = "/login", method = RequestMethod.GET)
	public String loginEntry() {
		return "login";
	}
}
