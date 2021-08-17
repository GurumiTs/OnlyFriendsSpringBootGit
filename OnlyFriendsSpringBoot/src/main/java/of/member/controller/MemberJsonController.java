package of.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import of.common.model.Users;
import of.common.model.UsersService;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;
import of.member.model.Member;
import of.member.model.MemberService;

@Controller
public class MemberJsonController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private Member member;
	@Autowired
	private UsersService usersService;
	@Autowired
	private Users users;

	@GetMapping(path = "/memberswipe")
	@ResponseBody
	public Member memberswipe(Model m) {
		List<Member> empList = memberService.findAll();
		int num = (int)(Math.random()*empList.size());
		member = empList.get(num);
		return member;
	}
}
