package of.chat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpAttributes;
import org.springframework.messaging.simp.SimpAttributesContextHolder;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import of.chat.model.ChatMessageModel;
import of.chat.model.ChatRepository;
import of.chat.model.ChatService;
import of.member.model.Member;

@Controller
public class ChatController {
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplete ;
	@Autowired
	private Chat chat;
	@Autowired
	private ChatService chatService;

	//傳送訊息給誰 誰可以用select 選取決定
	@MessageMapping("/chat.send/{to}")
	public void sendMessage(@DestinationVariable String to,@Payload final ChatMessageModel chatMessageModel) {
		//System.out.println("new msg:"+chatMessageModel.getContent());
		//System.out.println("new msg:"+chatMessageModel.getTime());	
		Chat chat = new Chat();
		chat.setSender(chatMessageModel.getSender());
		chat.setReceiver(to);
		chat.setContent(chatMessageModel.getContent());
		chatService.insert(chat);
		simpMessagingTemplete.convertAndSend("/topic/public/"+to,chatMessageModel);
		
	}
	
	//系統回傳給自己加入聊天室的訊息
	@MessageMapping("/chat.newUser/{to}")
	public void newUser(@DestinationVariable String to,@Payload final ChatMessageModel chatMessageModel,StompHeaderAccessor headerAccessor ) {
		headerAccessor.getSessionAttributes().put("username",chatMessageModel.getSender());
		System.out.println("new user:"+chatMessageModel.getSender());
		simpMessagingTemplete.convertAndSend("/topic/public/"+to,chatMessageModel);
	}
}
