package of.blog.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import of.blogusers.model.BlogUser;

public interface BlogRepository extends JpaRepository<BlogBean, Integer> {

	@Query(value = "SELECT * FROM BlogBean b WHERE b.memberAccount = ?1", nativeQuery = true)
	public List<BlogBean> findByMemberAccount(String memberAccount);
	
	
}
