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

	public UserActivity insert(UserActivity userActivity) {
		return userActivityRepositor.save(userActivity);
	}

	public UserActivity updata(UserActivity userActivity) {
		return userActivityRepositor.save(userActivity);
	}

	public List<UserActivity> selectAll() {
		return userActivityRepositor.findAll();
	}
	
	public UserActivity select(Integer number) {
		Optional<UserActivity> useravtivity = userActivityRepositor.findByNumber(number);
		if (useravtivity.isPresent()) {
			return useravtivity.get();
		}
		return null;
	}

	public void deleteById(int number) {
		userActivityRepositor.deleteById(number);
	}
	
	public List<UserActivity> findByAccount(String account){
		return userActivityRepositor.findByMemberAccount(account);
	}
	
	public List<UserActivity> findByType(String type){
		return userActivityRepositor.findByType(type);
	}
}
