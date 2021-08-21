package of.member.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberRepository extends JpaRepository<Member, String> {
	public Optional<Member> findByMemberAccount(String account);
	
	@Query(value = "from Member where memberName like concat('%',?1,'%')")
	public List<Member> findByMemberNameLike(String account);
}
