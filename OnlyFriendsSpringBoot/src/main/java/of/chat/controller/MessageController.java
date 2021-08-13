package of.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;

import of.chat.model.MessageModel;
import of.chat.model.UserStorage;

@RestController
public class MessageController {
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplete ;
	
	@MessageMapping("/chat/{to}")
	public void sendMessage(@DestinationVariable String to,MessageModel message) {
		System.out.println("handling send message:"+message+"to:"+to);
		boolean isExists = UserStorage.getInstance().getUsers().contains(to);
		if(isExists) {
			simpMessagingTemplete.convertAndSend("/topic/message/"+to,message); //configureMessageBroker
		}
	}
	
}
