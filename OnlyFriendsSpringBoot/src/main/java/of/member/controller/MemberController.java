package of.member.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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


//	@RequestMapping(path = "/signupmember.controller", method = RequestMethod.POST)
//	public String signupMemberController(@RequestParam(name = "empEmail", required = false) String memberEmail,
//			@RequestParam(name = "empPwd1", required = false) String memberPwd1,
//			@RequestParam(name = "empName", required = false) String memberName,
//			@RequestParam(name = "empPic", required = false) MultipartFile memberPic, HttpServletRequest request,
//			Model model) {
//
//		try {
//			String memberPassword = BCrypt.hashpw(memberPwd1, BCrypt.gensalt());
//
//			// pic
//			String fileName = memberPic.getOriginalFilename();
//			String path1 = request.getServletContext().getRealPath("/images");
//			String filePath = path1 + "\\memberPic\\" + fileName;
//			File saveFile = new File(filePath);
//			memberPic.transferTo(saveFile);
//
//			member.setMemberEmail(memberEmail);
//			member.setMemberName(memberName);
//			member.setMemberPic("images\\empPic\\" + fileName);
//			Member result = memberService.insert(member);
//			if (result != null) {
//				users.setUsersEmail(memberEmail);
//				users.setUsersPassword(memberPassword);
//				users.setUsersRole("member");
//				usersService.insert(users);
//				request.setAttribute("email", memberEmail);
//				return "forward:/signupmembermail.controller";
//			}else {
//				model.addAttribute("errorMsg", "signup member failed");
//				return "login";
//			}
//
//		} catch (Exception e) {
//			model.addAttribute("errorMsg", "signup member failed");
//			return "login";
//		}
//	}
//
//	@RequestMapping(path = "/signupmembermail.controller", method = RequestMethod.POST)
//	public String sendSignupMemberMail(HttpServletRequest request, Model model) {
//		try {
//			String email = (String) request.getAttribute("email");
//			Member member = memberService.findByMemberAccount(email);
//			String memberEmailCheckNum = GetRandomPwd.getRandomPassword();
//			member.setMemberEmailCheckNum(memberEmailCheckNum);
//			memberService.update(member);
//			SimpleMailMessage mail = new SimpleMailMessage();
//			mail.setTo(email);
//			mail.setFrom("onlyfriendseeit29@gmail.com");
//			mail.setSubject("Verify Account");
//			mail.setText("Click to verify:\n" + "http://localhost:8080/OnlyFriends/signupmembermailcheck" + "?email="
//					+ email + "&checknum=" + memberEmailCheckNum);
//			sender.send(mail);
//			model.addAttribute("successMsg", "sending verify mail success!");
//			return "login";
//		} catch (Exception e) {
//			model.addAttribute("errorMsg", "sending verify mail failed!");
//			return "login";
//		}
//	}
//
//	@RequestMapping(path = "signupmembermailcheck", method = RequestMethod.GET)
//	public String checkAccountMail(HttpServletRequest request) {
//		String email = request.getParameter("email");
//		String memberEmailCheckNum = request.getParameter("checknum");
//		Member member = memberService.findByMemberEmail(email);
//		String checkNum = member.getMemberEmailCheckNum();
//		if (checkNum.equals(memberEmailCheckNum)) {
//			member.setMemberEmailCheck(1);
//			memberService.update(member);
//			return "commonpages/emailverifysuccess";
//		}
//		return "commonpages/emailverifyfailed";
//	}
	
	@RequestMapping(path="/memberswipeloading" ,method = RequestMethod.GET )
	public String memberSwipeLoadingEntry() {
		return "memberpages/memberswipeloading" ;
	}
	
	@RequestMapping(path="/memberswipe" ,method = RequestMethod.GET )
	public String memberSwipeEntry() {
		return "memberpages/memberswipe" ;
	}

}
