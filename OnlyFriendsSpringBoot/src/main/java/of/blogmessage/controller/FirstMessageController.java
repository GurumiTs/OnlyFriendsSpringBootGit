package of.blogmessage.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.blogmessage.model.FirstMessage;
import of.blogmessage.model.FirstMessageRepository;
import of.blogmessage.model.FirstMessageService;
import of.member.model.Member;

@Controller
public class FirstMessageController {
	
	@Autowired
	private FirstMessageService fMesService;
	
	//查詢文章下所有留言Json檔案
	@PostMapping(path = "/firstmessagetojson/{articleId}")
	@ResponseBody
	public List<FirstMessage> queryAllByMessageID(@PathVariable(name = "articleId") Integer articleId, Model m){
		System.out.println("Message Controller ID:" + articleId);
		List<FirstMessage> firstMessage = fMesService.findByUsersArticleID(articleId);
		return firstMessage;
	}
	
	// Insert Message
	@PostMapping(path = "/addMessage")
	@ResponseBody
	public String addMessage(@RequestParam(name = "ArticleId") Integer articleId, 
							 @RequestParam(name = "messageText") String messageText,
							 HttpServletRequest request, Model m) {
		
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberName = m1.getMemberName();
		String memberPic = m1.getMemberPic();
		
		FirstMessage fMessage = new FirstMessage();
		fMessage.setUsersArticleID(articleId);
		fMessage.setMemberName(messageText);
		fMessage.setMemberName(memberName);
		fMessage.setMemberPic(memberPic);
		fMesService.insertMessage(fMessage);
		return "y";
	}
}
