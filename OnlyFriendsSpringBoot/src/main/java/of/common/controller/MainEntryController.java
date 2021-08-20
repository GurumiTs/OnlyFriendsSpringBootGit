package of.common.controller;

import java.security.Principal;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.common.model.UsersService;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;
import of.member.model.Member;
import of.member.model.MemberService;

@Controller
@SessionAttributes(names = { "personalinfo", "member", "employee","totalPages","totalElements"})
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
			String userType = usersService.findByEmail(currentUserName).getUsersRole();
			System.out.println(userType);
			if (userType.equals("employee")) {
				model.addAttribute("employee", "employee");
				Employee employee = empService.findByEmpEmail(currentUserName);
				model.addAttribute("personalinfo",employee);

			}
			if (userType.equals("member")) {
				model.addAttribute("member", "member");
				Member member = memberService.findByMemberAccount(currentUserName);
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
				Member member =memberService.findByMemberAccount(currentUserName);
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
	
	@RequestMapping(path = "/shopitem.controller", method = RequestMethod.GET)
	public String shopItemEntry() {
		return "frontcommonpages/shopitemexample";
	}
	
	@RequestMapping(path = "/shop.controller", method = RequestMethod.GET)
	public String shopEntry() {
		return "frontcommonpages/shopexample";
	}
	
	
	@PostMapping(path = "/queryallbypage/{pageNo}")
	@ResponseBody
	public List<Employee> processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m){
		
		int pageSize = 2;
		
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Employee> page = empService.findAllByPage(pageable);
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();
		
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		
		return page.getContent();
	}
	
	@RequestMapping(path = "/blogexample.controller", method = RequestMethod.GET)
	public String blogexampleEntry() {
		return "frontcommonpages/blogexample";
	}
	
	@RequestMapping(path = "/blogarticleample.controller", method = RequestMethod.GET)
	public String blogarticleexampleEntry() {
		return "frontcommonpages/blogarticleexample";
	}
	
	@RequestMapping(path = "/try.controller", method = RequestMethod.GET)
	public String tryEntry() {
		return "frontcommonpages/try";
	}
	
	@RequestMapping(path = "/404.controller", method = RequestMethod.GET)
	public String exceptEntry() {
		return "404";
	}
	

}
