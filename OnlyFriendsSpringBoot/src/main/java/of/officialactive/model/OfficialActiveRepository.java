package of.officialactive.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OfficialActiveRepository extends JpaRepository<OfficialActive,Long> {
		   
	public Optional<OfficialActive> findByAnum(Long anum);
	
		}

