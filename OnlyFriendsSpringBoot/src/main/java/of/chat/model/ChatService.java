package of.chat.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import of.member.model.Member;

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
	
	public List<Chat> findInvite(String receiver,String chattype){
		return chatRepository.findInvite(receiver, chattype);
	}
	
	public List<Chat> findNotification(String username,String chattype){
		return chatRepository.findNotification(username, chattype);
	}
	
	public void clearnotification(String username){
		 chatRepository.deleteByReceiver(username);
	}
	
	public Chat findById(Integer id) {
		Optional<Chat> chatOptional = chatRepository.findById(id);
		return chatOptional.get();
	}
	
	public void deleteById(Integer id) {
		chatRepository.deleteById(id);
	}
}
