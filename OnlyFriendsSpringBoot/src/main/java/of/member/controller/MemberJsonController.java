package of.member.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import of.common.model.Users;
import of.common.model.UsersService;
import of.common.util.BCrypt;
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
	
	@RequestMapping(path = "/memberUpdateBasicInfo",method = RequestMethod.POST)
	@ResponseBody
	public String updateEmployeeBasicInfo(@RequestParam(name = "email") String email,
			@RequestParam(name = "account", required = false) String account,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam(name = "age", required = false) String sage,
			@RequestParam(name = "phone", required = false) String phone,
			@RequestParam(name = "address", required = false) String address,
			@RequestParam(name = "county", required = false) String county,
			@RequestParam(name = "district", required = false) String district,
			@RequestParam(name = "zipcode", required = false) String zipcode,
			@RequestParam(name = "hobby1", required = false) String hobby1,
			@RequestParam(name = "hobby2", required = false) String hobby2,
			@RequestParam(name = "hobby3", required = false) String hobby3,
			@RequestParam(name = "personalInfo", required = false) String pInfo,Model model) {
		try {
			int age = Integer.parseInt(sage);
			member = memberService.findByMemberAccount(account);
			member.setMemberEmail(email);
			member.setMemberAccount(account);
			member.setMemberName(name);
			member.setMemberAge(age);
			member.setMemberPhone(phone);
			member.setMemberAddress(address);
			member.setMemberCounty(county);
			member.setMemberDistrict(district);
			member.setMemberZipcode(zipcode);
			member.setTagOne(hobby1);
			member.setTagTwo(hobby2);
			member.setTagThree(hobby3);
			member.setPersonalInfo(pInfo);
			memberService.update(member);		
			return "y";
		} catch (Exception e) {
			return "n";
		}
	}
	
	@PostMapping(path = "/memberUpdatePic")	
	@ResponseBody
	public String memberUpdatePic(@RequestParam(name = "pic") MultipartFile multipartFile,@RequestParam(name = "memberAccount") String memberAccount) {
		try {
			System.out.println(memberAccount);
			String fileName = multipartFile.getOriginalFilename();
			String path = ResourceUtils.getURL("classpath:static/images/memberPic").getPath();
			System.out.println(path);
			String filePath =  path+ "/" + fileName;	
			File saveFile = new File(filePath);
			multipartFile.transferTo(saveFile);
			Member member = memberService.findByMemberAccount(memberAccount);
			member.setMemberPic("images/empPic/" + fileName);
			memberService.update(member);		
			return "y";
		} catch (Exception e) {
			
			return "n";
		}
	}

	@PostMapping(path = "/memberBasicInfoQuery")
	@ResponseBody
	public Member memberBasicInfoQuery(@RequestParam(name = "memberAccount") String memberAccount) {
		Member member = memberService.findByMemberAccount(memberAccount);
		return member;
	}
	
	
	
	@PostMapping(path = "/memberRegister")
	@ResponseBody
	public String updateEmployeeBasicInfo(@RequestParam(name = "memberAccount") String memberAccount,
			@RequestParam(name = "empPwd1") String empPwd1,Model model) {
		try {	
			String password = BCrypt.hashpw(empPwd1, BCrypt.gensalt());
			users.setUsersEmail(memberAccount);	
			users.setUsersPassword(password);
			users.setUsersRole("member");
			usersService.insert(users);
			
			
			member.setMemberAccount(memberAccount);
			member.setMemberName("Users");
			member.setMemberPic("images/smallicon/nonephoto2.svg");
			memberService.insert(member);
			return "y";
		} catch (Exception e) {
			return "n";
		}
	}
	
}
