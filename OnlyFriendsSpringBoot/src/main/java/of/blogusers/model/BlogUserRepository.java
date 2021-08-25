package of.blogusers.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;


public interface BlogUserRepository extends JpaRepository<BlogUser, Integer> {
	Optional<BlogUser> findByMemberAccount(String MemberAccount);
}
