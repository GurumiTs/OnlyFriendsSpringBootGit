package of.chat.controller;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpAttributes;
import org.springframework.messaging.simp.SimpAttributesContextHolder;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import of.chat.model.ChatMessageModel;

@Controller
public class ChatController {

	@MessageMapping("/chat.send")
	@SendTo("/topic/public")
	public ChatMessageModel sendMessage(@Payload final ChatMessageModel chatMessageModel) {
		System.out.println("new msg:"+chatMessageModel.getContent());
		return chatMessageModel;
	}
	
	@MessageMapping("/chat.newUser")
	@SendTo("/topic/public")
	public ChatMessageModel newUser(@Payload final ChatMessageModel chatMessageModel,StompHeaderAccessor headerAccessor ) {
		headerAccessor.getSessionAttributes().put("username",chatMessageModel.getSender());
		System.out.println("new user:"+chatMessageModel.getSender());
		return chatMessageModel;
	}
}
