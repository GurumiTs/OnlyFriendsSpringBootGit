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

import of.chat.model.ChatService;
import of.member.model.Member;

@Controller
public class ChatJsonController {
	@Autowired
	private Chat chat;
	@Autowired
	private ChatService chatService;
	
	@PostMapping(path = "/chathistory/{to}")
	@ResponseBody
	public List<Chat> memberBasicInfoQuery(HttpServletRequest request,@PathVariable(name = "to") String to) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String m1account = m1.getMemberAccount();
		System.out.println(m1account);
		List<Chat> list = chatService.findAllChat(m1account, to);
		return list;
	}
	
	@PostMapping(path = "/bellhistory/{username}")
	@ResponseBody
	public List<Chat> bellHistoryQuery(HttpServletRequest request,@PathVariable(name = "username") String username) {		
		List<Chat> list = chatService.findAllChat(username,"official");
		return list;
	}

}
