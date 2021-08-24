package of.chat.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import of.chat.controller.Chat;

@Service
@Transactional
public class ChatService {

	@Autowired
	private ChatRepository chatRepository;
	
	public Chat insert(Chat chat) {
		return chatRepository.save(chat);
	}
	
	public List<Chat> findAllChat(String receiver,String sender){
		return chatRepository.findAllChat(receiver, sender);
	}
	
}
