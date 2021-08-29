package of.UserActivity.model;

import java.util.Optional;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserActivityRepositor extends JpaRepository<UserActivity, Integer> {

	public Optional<UserActivity> findByNumber(Integer number);

	// 依活動類型查詢
	public List<UserActivity> findByType(String type);

	// 查詢個人創辦活動
	@Query(value = "SELECT * FROM UserActivity u WHERE u.memberAccount = ?1", nativeQuery = true)
	public List<UserActivity> findByMemberAccount(String memberAccont);

	// 使用活動編號找到活動
	@Query(value = "SELECT * FROM UserActivity u WHERE u.number = ?1", nativeQuery = true)
	public List<UserActivity> findBynumber(List<Integer> activitynumber);
	
	//在 participate 找到參加者有參加哪些活動
	@Query(value = "SELECT * FROM participate p WHERE p.memberAccount = ?1", nativeQuery = true)
	public List<Integer> findByparticipate(Integer activitynumber);
	
	//類別查詢 
	@Query(value = "SELECT * FROM UserActivity u WHERE u.type = ?1", nativeQuery = true)
	public List<UserActivity> findBytype(String type);
}
