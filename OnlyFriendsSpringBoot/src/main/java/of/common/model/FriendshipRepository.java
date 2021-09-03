package of.common.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface FriendshipRepository extends JpaRepository<Friendship, String>{
	
	@Query(value = "select chatnum from Friendship c where c.usersEmail = ?1 and c.memberAccount = ?2 ", nativeQuery = true)
	public Integer chatnum(String username,String selectUser);
	
	@Query(value = "select chatnum from Friendship c where c.usersEmail = ?1", nativeQuery = true)
	public List<Integer> mychatnum(String username);
	
	@Query(value = "update Friendship set chatnum = ?1 where usersEmail = ?2 and memberAccount = ?3", nativeQuery = true)
	@Modifying
	public void updatechatnum(Integer chatnum,String username,String selectUser);

}
