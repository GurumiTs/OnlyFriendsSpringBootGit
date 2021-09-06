package of.officialactive.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberActiveRepository extends JpaRepository<MemberActive, Long> {

	public Optional<MemberActive> findByAnum(Long anum);
}
