package of.blogmessage.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface FirstMessageRepository extends JpaRepository<FirstMessage, Integer> {
	
	@Query(value = "SELECT * FROM BlogMessage m WHERE m.UsersArticleID = ?1", nativeQuery = true)
	public List<FirstMessage> findByUsersArticleID(Integer usersArticleID);
	 
	@Query(value = "DELETE FROM BlogMessage b WHERE b.UsersArticleID = ?1", nativeQuery = true)
	public void deleteByArticleID(Integer usersArticleID);
}
