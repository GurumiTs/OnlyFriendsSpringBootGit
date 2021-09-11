package of.member.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import of.chat.model.Chat;
import of.chat.model.ChatMessageModel;
import of.chat.model.ChatService;
import of.chat.model.MessageType;
import of.common.model.FriendshipService;
import of.common.model.Users;
import of.common.model.UsersService;
import of.common.util.BCrypt;
import of.common.util.GetRandomPwd;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;
import of.member.model.Member;
import of.member.model.MemberChatnum;
import of.member.model.MemberService;
import of.member.model.StoredService;

@Controller
@SessionAttributes(names = { "personalinfo", "member" })
public class MemberJsonController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private Member member;
	@Autowired
	private UsersService usersService;
	@Autowired
	private Users users;
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplete;
	@Autowired
	private Chat chat;
	@Autowired
	private ChatService chatService;
	@Autowired
	private JavaMailSender sender;
	@Autowired
	private FriendshipService friendshipService;
	@Autowired
	private StoredService storedService;
	
	

	@GetMapping(path = "/memalltojson")
	@ResponseBody
	public Map allEmployeeToJson(Model m) {
		List<Member> memberList = memberService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("data", memberList);
		return map;
	}

	@RequestMapping(path = "/memberUpdateBasicInfo", method = RequestMethod.POST)
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
			@RequestParam(name = "personalInfo", required = false) String pInfo, Model model) {
		try {
			int age = Integer.parseInt(sage);
			Member member = memberService.findByMemberAccount(account);
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
			Member m2 = memberService.findByMemberAccount(account);
			model.addAttribute("personalinfo",m2);
			return "y";
		} catch (Exception e) {
			return "n";
		}
	}

	@PostMapping(path = "/memberUpdatePic")
	@ResponseBody
	public String memberUpdatePic(@RequestParam(name = "pic") MultipartFile multipartFile,
			@RequestParam(name = "memberAccount") String memberAccount) {
		try {
			System.out.println(memberAccount);
			String fileName = multipartFile.getOriginalFilename();
			String path = ResourceUtils.getURL("classpath:static/images/memberPic").getPath();
			// System.out.println(path);
			String filePath = path + "/" + fileName;
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
	
	@PostMapping(path = "/memberfriendsnum")
	@ResponseBody
	public List<Map> memberFriendsNum(@RequestParam(name = "memberAccount") String memberAccount) {
		Member member = memberService.findByMemberAccount(memberAccount);
		Users u1  = usersService.findByEmail(memberAccount);
		String a = Integer.toString(u1.getFriends().size()); 
		String b   = Float.toString((storedService.memberstoredtotal(memberAccount))/100);
		b=b.substring(0,b.indexOf('.'));
		List<Map> list = new ArrayList<>();
		Map m1 = new HashMap<String, Object>();
		m1.put("member",member);
		m1.put("friendsnum", a);
		m1.put("level", b);
		
		list.add(m1);
		
		return list ;

	}

	@PostMapping(path = "/memberswipe")
	@ResponseBody
	public Member memberswipe(Model m, HttpServletRequest request) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String m1account = m1.getMemberAccount();
		Users users1 = usersService.findByEmail(m1account);
		List<Member> friends = users1.getFriends();
		List<Member> empList = memberService.findAll();
		while (true) {
			int num = (int) (Math.random() * empList.size());
			// System.out.println("random number:"+num);
			member = empList.get(num);
			// System.out.println(member.getMemberAccount());
			// System.out.println("存在與否:"+friends.contains(member));
			if (member.getMemberAccount().equals(m1account) || friends.contains(member) == true) {

				continue;
			}
			break;
		}
		return member;
	}

	@PostMapping(path = "/membercoinsdelete")
	@ResponseBody
	public Member memberCoinDelete(HttpServletRequest request, Model model) {
		// get account from session nut the info not the newest
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		// so get the member again
		Member m2 = memberService.findByMemberAccount(memberAccount);
		int swipeTime = Integer.parseInt(m2.getSwipeTime());
		int deleteSwipeTime = swipeTime - 1;
		String newSwipeTime = Integer.toString(deleteSwipeTime);
		m2.setSwipeTime(newSwipeTime);
		memberService.update(m2);
		model.addAttribute("personalinfo", m2);
		return m2;
	}

	@PostMapping(path = "/membercoinsquery")
	@ResponseBody
	public Member memberCoinsQuery(HttpServletRequest request) {
		// get account from session nut the info not the newest
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		// so get the member again
		Member m2 = memberService.findByMemberAccount(memberAccount);
		// System.out.println("player name:"+m2.getMemberName());
		Calendar now = Calendar.getInstance(TimeZone.getTimeZone("GMT :08:00"));
		String day = Integer.toString(now.get(Calendar.DATE));

		System.out.println("i'm date:" + day);
		if (m2.getSwipeDate().equals(day) == false) {
			String newswipetime = String.valueOf(Integer.parseInt(m2.getSwipeTime())+3) ; 
			m2.setSwipeTime(newswipetime);
			memberService.update(m2);
		}
		m2.setSwipeDate(day);
		memberService.update(m2);
		return m2;
	}
	
	@PostMapping(path = "/memberaddfriend/{inviteid}")
	@ResponseBody
	public Object memberAddFriend(@PathVariable(name = "inviteid") String inviteid, HttpServletRequest request) {
		Integer id = Integer.parseInt(inviteid);
		Chat chat = chatService.findById(id);
		String userEmail = chat.getReceiver(); //我(接收到好友邀請)
		String memberAccount = chat.getSender(); //發出好友邀請者
		
		Member m1 = memberService.findByMemberAccount(userEmail);
		Member m2 = memberService.findByMemberAccount(memberAccount);
		
		Users users1 = usersService.findByEmail(userEmail);
		Users users2 = usersService.findByEmail(memberAccount);
		
		users1.addFriend(m2);
		users2.addFriend(m1);
		chatService.deleteById(id);
		
		LocalDateTime myDateObj = LocalDateTime.now();
		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
		String formattedDate = myDateObj.format(myFormatObj);
		
		Chat notify = new Chat();
		chat.setType(MessageType.NOTIFICATION);
		chat.setSender("official");
		chat.setReceiver(memberAccount);
		chat.setContent(m1.getMemberName()+"已接受你的交友邀請");
		chat.setTexttime(formattedDate);
		chatService.insert(chat);
		
		return chat;
	}
	
	@PostMapping(path = "/deleteinvite/{inviteid}")
	@ResponseBody
	public Object deleteInvite(@PathVariable(name = "inviteid") String inviteid, HttpServletRequest request) {
		Integer id = Integer.parseInt(inviteid);
		Chat chat = chatService.findById(id);
		String userEmail = chat.getReceiver(); //我(接收到好友邀請)
		String memberAccount = chat.getSender(); //發出好友邀請者
		
		Member m1 = memberService.findByMemberAccount(userEmail);
		Member m2 = memberService.findByMemberAccount(memberAccount);

		chatService.deleteById(id);
		
		LocalDateTime myDateObj = LocalDateTime.now();
		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
		String formattedDate = myDateObj.format(myFormatObj);
		
		Chat notify = new Chat();
		chat.setType(MessageType.NOTIFICATION);
		chat.setSender("official");
		chat.setReceiver(memberAccount);
		chat.setContent(m1.getMemberName()+"拒絕你的交友邀請");
		chat.setTexttime(formattedDate);
		chatService.insert(chat);
		
		return chat;
	}

//Member mtry = memberService.findByMemberAccount("1011");
//Users userstry = usersService.findByEmail("1029");
//userstry.addFriend(mtry);

	

	@PostMapping(path = "/memberInvitefriend/{addfriendid}")
	@ResponseBody
	public Object memberInviteFriend(@PathVariable(name = "addfriendid") String addfriendid,
			HttpServletRequest request) {

		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		Users users = usersService.findByEmail(memberAccount);
		List<Member> friends = users.getFriends();
		Member friend = memberService.findByMemberAccount(addfriendid);

		if (friends.contains(friend) == true) {
			return new ResponseEntity(HttpStatus.BAD_REQUEST);
		}

//		建立訊息時間		
	

		Chat chat = new Chat();
		chat.setType(MessageType.INVITE);
		chat.setSender(memberAccount);
		chat.setReceiver(addfriendid);
		chat.setContent("來自" + m1.getMemberName()+"的交友邀請");
		chat.setTexttime(m1.getMemberPic());
		chatService.insert(chat);

		return users;
	}

	@PostMapping(path = "/memberfriendsquery")
	@ResponseBody
	public List<MemberChatnum>  memberFriendsQuery(HttpServletRequest request) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		List<Member> friends = usersService.findByEmail(memberAccount).getFriends();
		List<MemberChatnum> friendlist = new ArrayList<>();
		for(Member m : friends) {
			Integer chatnum = friendshipService.chatnum(memberAccount,m.getMemberAccount());
			MemberChatnum mcn = new MemberChatnum();
			mcn.setFriendAccount(m.getMemberAccount());
			mcn.setFriendName(m.getMemberName());
			mcn.setFriendPic(m.getMemberPic());
			mcn.setChatnum(chatnum);
			friendlist.add(mcn);
		}

		return friendlist ;
	}

	@PostMapping(path = "/memberfriendssearch/{friendname}")
	@ResponseBody
	public List<Member> memberFriendsSearch(@PathVariable(name = "friendname") String friendname,
			HttpServletRequest request) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		List<Member> friends = usersService.findByEmail(memberAccount).getFriends();
		List<Member> searchFriends = new ArrayList<Member>();
		for (int i = 0; i < friends.size(); i++) {
			if (friends.get(i).getMemberName().contains(friendname) == true) {
				searchFriends.add(friends.get(i));
			}
		}
		// List<Member> friends = memberService.findByMemberNameLike(friendname);

		return searchFriends;
	}

	@PostMapping(path = "/memquery")
	@ResponseBody
	public Member processRestQueryEmployee(@RequestParam(name = "account") String account) {
		Member member = memberService.findByMemberAccount(account);
		return member;
	}

	@PostMapping(path = "/banuser")
	@ResponseBody
	public String banMember(@RequestParam(name = "memberAccount") String memberAccount) {
		Member member = memberService.findByMemberAccount(memberAccount);
		if (member.getMemberAuth() == 1) {
			member.setMemberAuth(0);
			memberService.update(member);
		} else {
			member.setMemberAuth(1);
			memberService.update(member);
		}

		return "y";
	}

	@PostMapping(path = "/memberdelete/{memberAccount}")
	@ResponseBody
	public String deleteMember(@PathVariable("memberAccount") String memberAccount) {
		Member member = memberService.findByMemberAccount(memberAccount);
		memberService.deleteById(memberAccount);
		usersService.deleteById(memberAccount);
		return "yes";
	}
	
	@PostMapping(path = "/clearnotification")
	@ResponseBody
	public String deleteMember(HttpServletRequest request) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		chatService.clearnotification(memberAccount);
		return "yes";
	}
	@PostMapping(path = "/total")
	@ResponseBody
	public List<Float> totalEntry() {
		List<Float> total = new ArrayList<Float>();
		
		for(int i = 1;i<=12;i++) {
			Float f = storedService.searchtotal(i);
			if(f == null) {
				f = (float) 0;
			}
			total.add(f);
		}
		return total;	
		
	}
	
	@PostMapping(path = "/storedannual")
	@ResponseBody
	public Float storedannualEntry() {
	
		return storedService.storedannual();
		
	}
	
	
	

}
