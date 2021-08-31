package of.blogusers.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


public interface BlogUserRepository extends JpaRepository<BlogUser, Integer> {
	
	@Query(value = "SELECT * FROM BlogUsers b WHERE b.memberAccount = ?1", nativeQuery = true)
	public List<BlogUser> findByMemberAccount(String memberAccount);
	
	
	
}
