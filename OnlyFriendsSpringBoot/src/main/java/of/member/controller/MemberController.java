package of.member.controller;

import java.io.File;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import of.common.model.Users;
import of.common.model.UsersService;
import of.common.util.BCrypt;
import of.common.util.GetRandomPwd;
import of.emp.model.Employee;
import of.member.model.Member;
import of.member.model.MemberService;

@Controller
@SessionAttributes(names = { "successMsg", "errorMsg" })
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private Member member;
	@Autowired
	private UsersService usersService;
	@Autowired
	private Users users;
	@Autowired
	private JavaMailSender sender;
	

	
	@RequestMapping(path="/member" ,method = RequestMethod.GET )
	public String memberEntry() {
		return "memberpages/member" ;
	}
	
	@RequestMapping(path="/memberprofile" ,method = RequestMethod.GET )
	public String memberProfile() {
		return "memberpages/memberprofile" ;
	}

	@RequestMapping(path="/memberswipeloading" ,method = RequestMethod.GET )
	public String memberSwipeLoadingEntry() {
		return "memberpages/memberswipeloading" ;
	}
	
	@RequestMapping(path="/memberswipe" ,method = RequestMethod.GET )
	public String memberSwipeEntry() {
		return "memberpages/memberswipe" ;
	}
	
	@RequestMapping(path="/memberaddfriend" ,method = RequestMethod.GET )
	@ResponseBody
	public String memberAddFriend() {
		
//**	test add two friend into users 
//		Member m1 = memberService.findByMemberAccount("1011");
//		Member m2 = memberService.findByMemberAccount("1012");
//		
//		Users users = usersService.findByEmail("1013");
//		users.addFriend(m1);
//		users.addFriend(m2);
//		usersService.update(users);
//		
//**	test remove friend from users
//		Member m2 = memberService.findByMemberAccount("1012");
//		Users users = usersService.findByEmail("1013");
//		users.remove(m2);
//		usersService.update(users);
		
//**	show the users friends by json  return type should change to List<Member>
//		Users users = usersService.findByEmail("1013");
//		System.out.println(users.getUsersEmail());
//		System.out.println(users.getFriends());
//		List<Member> friends = users.getFriends(); 
		
		
//**	delete one users should delete the same member cause these two key have reference
//		memberService.deleteById("1013");
//		usersService.deleteById("1013");
		
//**	test List<> exist another <> obj or not		
//		List<Member> friends = usersService.findByEmail("1013").getFriends();
//		Member m1 = memberService.findByMemberAccount("1021");
//		boolean exist = friends.contains(m1);
//		System.out.println(exist);
		
		return "y" ;
	}
	
	
	

}
