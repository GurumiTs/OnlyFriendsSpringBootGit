package of.member.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, String> {
	public Optional<Member> findByMemberEmail(String email);
}
