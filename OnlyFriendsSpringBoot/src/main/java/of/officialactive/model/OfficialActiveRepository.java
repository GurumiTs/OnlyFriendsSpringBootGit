package of.officialactive.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OfficialActiveRepository extends JpaRepository<OfficialActive,Long> {
		   
	public Optional<OfficialActive> findByAnum(Long anum);
	
//	@Query ("SELECT oa from OfficialActive oa")
//	List<OfficialActive> getAllOfficialActive();
//	
//	@Query("SELECT NEW of.officialactive.model.OfficialActiveFindOa(oa.empAcc,oa.anum,oa.atype,oa.atype2,oa.adate,oa.startDeadline,oa.finishDeadline,oa.active,oa.county,oa.dustrict,oa.conditions,oa.male,oa.female,oa.img)"
//			+"FROM OfficialActive oa"
//			+"LEFT JOIN OfficialActive ua ON oa.memberAccount = ua.anum")
//	List<OfficialActiveFindOa> getOaData();
//	
	@Query(value = "SELECT anum,empAcc,aname,atype,atype2,adate,startdeadline,finishdeadline,active,county,district,conditions,male,female,img  FROM OfficialActive ", nativeQuery=true)
	public List <OfficialActiveFindOa> findByAll();
		}

