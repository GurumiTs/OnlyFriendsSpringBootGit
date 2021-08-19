package of.blogusers.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;


public interface BlogUserRepository extends JpaRepository<BlogUser, Integer> {
	Optional<BlogUser> findByMemberAccount(String MemberAccount);
}
