package of.blog.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import of.blogusers.model.BlogUser;

public interface BlogRepository extends JpaRepository<BlogBean, Integer> {

	@Query(value = "SELECT * FROM BlogBean b WHERE b.memberAccount = ?1", nativeQuery = true)
	public List<BlogBean> findByMemberAccount(String memberAccount);
	
	@Query(value = "SELECT * FROM BlogBean b WHERE b.Blogtype = ?1", nativeQuery = true)
	public List<BlogBean> findByBlogType(String blogType);
	
	@Query(value = "SELECT * FROM BlogBean b WHERE b.Blogtype = ?1", nativeQuery = true)
	public Page<BlogBean> findAllByBlogType(String blogType, Pageable pageable);
	
}
