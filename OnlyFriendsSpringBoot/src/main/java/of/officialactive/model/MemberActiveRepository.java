package of.officialactive.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import of.UserActivity.model.UserActivity;

public interface MemberActiveRepository extends JpaRepository<MemberActive, Long> {
	//查詢單筆
	public Optional<MemberActive> findByAnum(Long anum);
	
	
	// 使用活動編號找到活動
	@Query(value = "SELECT * FROM OfficialActive u WHERE u.anum = ?1", nativeQuery = true)
	public List<OfficialActive> findByAnumAct(List<MemberActive> anumAct);
	
	//中介表格查詢個人參加活動
	@Query(value = "select anum from memberactive oa where oa.memberAccount = ?1" , nativeQuery = true)
	public List<Long> findByMemAcc(String memberAccount);


	

}
