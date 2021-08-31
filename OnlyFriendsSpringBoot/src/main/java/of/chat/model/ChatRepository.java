package of.chat.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import of.member.model.Member;

public interface ChatRepository extends JpaRepository<Chat, Integer> {
	
	@Query(value = "select * from Chat c where (c.receiver = ?1 and c.sender = ?2)  or c.receiver = ?2 and c.sender = ?1", nativeQuery = true)
	public List<Chat> findAllChat(String receiver,String sender);
	
	@Query(value = "select * from Chat c where c.receiver = ?1 and c.chattype = ?2 ", nativeQuery = true)
	public List<Chat> findInvite(String receiver,String chattype);
	
	@Query(value = "select * from Chat c where c.receiver = ?1 and c.chattype = ?2 ", nativeQuery = true)
	public List<Chat> findNotification(String username,String chattype);
	

	public void deleteByReceiver(String username);
	
	public Optional<Chat> findById(Integer id);

}
