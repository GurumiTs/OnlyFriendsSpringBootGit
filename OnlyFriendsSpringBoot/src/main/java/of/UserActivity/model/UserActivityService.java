package of.UserActivity.model;

import java.util.Optional;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserActivityService {

	@Autowired
	private UserActivityRepositor userActivityRepositor;

	// 新增
	public UserActivity insert(UserActivity userActivity) {
		return userActivityRepositor.save(userActivity);
	}

	// 修改
	public UserActivity updata(UserActivity userActivity) {
		return userActivityRepositor.save(userActivity);
	}

	// 刪除
	public void deleteById(Integer number) {
		userActivityRepositor.deleteById(number);
	}

	// 選擇單筆活動
	public UserActivity select(Integer number) {
		Optional<UserActivity> useravtivity = userActivityRepositor.findByNumber(number);
		if (useravtivity.isPresent()) {
			return useravtivity.get();
		}
		return null;
	}

	// emp 查詢全部
	public List<UserActivity> selectAll() {
		return userActivityRepositor.findAll();
	}

	// user 查詢僅開放活動
	public List<UserActivity> apporve() {
		return userActivityRepositor.findByapprove();
	}

	// 查詢個人創辦活動
	public List<UserActivity> findByAccount(String account) {
		return userActivityRepositor.findByMemberAccount(account);
	}

	// 使用活動編號找到活動
	public List<UserActivity> findBynumber(List<Integer> activitynumber) {
		return userActivityRepositor.findBynumber(activitynumber);
	}

	// 在 participate 找到參加者有參加哪些活動
	public List<Integer> findByparticipate(Integer activitynumber) {
		return userActivityRepositor.findByparticipate(activitynumber);
	}

}
