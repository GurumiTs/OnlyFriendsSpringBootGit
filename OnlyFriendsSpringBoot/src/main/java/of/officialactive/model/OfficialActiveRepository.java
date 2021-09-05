package of.officialactive.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OfficialActiveRepository extends JpaRepository<OfficialActive,Long> {
		   
	public Optional<OfficialActive> findByAnum(Long anum);
	
	@Query(value = "SELECT anum,empAcc,aname,atype,atype2,adate,startdeadline,finishdeadline,active,county,district,conditions,male,female,img  FROM OfficialActive ", nativeQuery=true)
	public List <OfficialActiveFindOa> findByAll();
		}

