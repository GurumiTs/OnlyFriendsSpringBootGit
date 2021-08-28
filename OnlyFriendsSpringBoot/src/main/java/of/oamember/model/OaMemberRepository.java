package of.oamember.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OaMemberRepository extends JpaRepository<OaMember, String> {


	Optional<OaMember> findByMemberAccount(String MemberAccount);

	
	
}
