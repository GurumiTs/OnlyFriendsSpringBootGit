package of.officialactive.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OfficialActiveRepository extends JpaRepository<OfficialActive,Long> {
		   
	public Optional<OfficialActive> findByAnum(Long anum);
	
	@Query(value ="SELECT * FROM OfficialActive b Where b.atype=?1", nativeQuery = true)
	public List<OfficialActive> findByAtype(String atype);
}