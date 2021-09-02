package of.chat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import of.chat.model.Chat;
import of.chat.model.ChatService;
import of.common.model.FriendshipService;
import of.member.model.Member;

@Controller
public class ChatJsonController {
	@Autowired
	private Chat chat;
	@Autowired
	private ChatService chatService;
	@Autowired
	private FriendshipService friendshipService;
	
	@PostMapping(path = "/chathistory/{to}")
	@ResponseBody
	public List<Chat> memberBasicInfoQuery(HttpServletRequest request,@PathVariable(name = "to") String to) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String m1account = m1.getMemberAccount();
		System.out.println(m1account);
		List<Chat> list = chatService.findAllChat(m1account, to);
		return list;
	}
	
	@PostMapping(path = "/notificationhistory/{username}")
	@ResponseBody
	public List<Chat> bellHistoryQuery(HttpServletRequest request,@PathVariable(name = "username") String username) {		
		List<Chat> list = chatService.findNotification(username,"4");
		return list;
	}
	
	@PostMapping(path = "/invitehistory")
	@ResponseBody
	public List<Chat> inviteHistoryQuery(HttpServletRequest request) {		
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String m1account = m1.getMemberAccount();
		List<Chat> list = chatService.findInvite(m1account,"3");
		return list;
	}
	
	@PostMapping(path = "/addchatnum/{selectUser}")
	@ResponseBody
	public String chatnum(HttpServletRequest request,@PathVariable(name = "selectUser") String selectUser) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String m1account = m1.getMemberAccount();
		Integer chatnum = friendshipService.chatnum(m1account, selectUser);	
		Integer addc = chatnum+1;
		friendshipService.updatechatnum(addc,m1account, selectUser);
		return "y";
	}
	
	@PostMapping(path = "/clearchatnum/{selectUser}")
	@ResponseBody
	public String clearchatnum(HttpServletRequest request,@PathVariable(name = "selectUser") String selectUser) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String m1account = m1.getMemberAccount();
		friendshipService.updatechatnum(0,m1account, selectUser);
		
		return "y" ;
	}


}
