package of.common.controller;

import java.security.Principal;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
@SessionAttributes(names = { "personalinfo", "member", "employee" })
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
	public String mainEntry(Model model,HttpServletRequest request) {
		try {
			String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();
			//System.out.println(currentUserName);
			//Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
			   // String username = principal.toString();
			    //System.out.println(username);		    

			String userType = usersService.findByEmail(currentUserName).getUsersRole();
			if (userType.equals("employee")) {
				model.addAttribute("employee", "employee");
				Employee employee = empService.findByEmpEmail(currentUserName);
				model.addAttribute("personalinfo",employee);

			}
			if (userType.equals("member")) {
				model.addAttribute("member", "member");
				Member member =memberService.findByMemberEmail(currentUserName);
				model.addAttribute("personalinfo",member);
				
			}
			return "index";
		} catch (Exception e) {
			return "index";
		}

	}
	
	@RequestMapping(path = "/index", method = RequestMethod.GET)
	public String indexEntry(Model model) {
		try {
			String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();
			System.out.println(currentUserName);
			String userType = usersService.findByEmail(currentUserName).getUsersRole();
			if (userType.equals("employee")) {
				model.addAttribute("employee", "employee");
				Employee employee = empService.findByEmpEmail(currentUserName);
				model.addAttribute("personalinfo",employee);

			}
			if (userType.equals("member")) {
				model.addAttribute("member", "member");
				Member member =memberService.findByMemberEmail(currentUserName);
				model.addAttribute("personalinfo",member);
				
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
	
	@RequestMapping(path = "/chatroom.controller", method = RequestMethod.GET)
	public String chatRoomEntry() {
		return "chatroom";
	}
	
	@RequestMapping(path = "/chatroome.controller", method = RequestMethod.GET)
	public String chateRoomEntry() {
		return "example";
	}

}
