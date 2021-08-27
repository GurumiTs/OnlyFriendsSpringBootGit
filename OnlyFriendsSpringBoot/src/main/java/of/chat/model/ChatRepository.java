package of.chat.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import of.chat.controller.Chat;
import of.member.model.Member;

public interface ChatRepository extends JpaRepository<Chat, Integer> {
	
	@Query(value = "select * from Chat c where (c.receiver = ?1 and c.sender = ?2)  or c.receiver = ?2 and c.sender = ?1", nativeQuery = true)
	public List<Chat> findAllChat(String receiver,String sender);
	

}
