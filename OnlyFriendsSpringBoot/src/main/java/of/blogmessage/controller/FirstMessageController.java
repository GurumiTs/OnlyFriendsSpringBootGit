package of.blogmessage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.blogmessage.model.FirstMessage;
import of.blogmessage.model.FirstMessageRepository;

@Controller
public class FirstMessageController {
	
	@Autowired
	private FirstMessageRepository fMesRepository;
	
	@PostMapping(path = "/firstmessagetojson")
	@ResponseBody
	public Map queryAllByMessageID(@RequestParam(name = "ArticleId") Integer articleId, Model m){
		System.out.println("Message Controller ID:" + articleId);
		List<FirstMessage> firstMessage = fMesRepository.findByUsersArticleID(articleId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FirstMessage", firstMessage);
		return map;
	}
	
	// Insert Message
	@PostMapping(path = "/")
	@ResponseBody
	public String addMessage(@RequestParam(name = "ArticleId") Integer articleId, 
							 @RequestParam(name = "messageText") String messageText,
							 HttpServletRequest request, Model m) {
		return "y";
	}
}
