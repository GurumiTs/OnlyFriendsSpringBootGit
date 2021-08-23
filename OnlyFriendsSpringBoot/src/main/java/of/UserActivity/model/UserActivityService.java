//package of.UserActivity.model;
//
//import java.util.Optional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//@Service
//@Transactional
//public class UserActivityService {
//
//	@Autowired
//	private UserActivityRepositor userActivityRepositor;
//
//	public UserActivity insert(UserActivity userActivity) {
//		return userActivityRepositor.save(userActivity);
//	}
//
//	public UserActivity updata(UserActivity userActivity) {
//		return userActivityRepositor.save(userActivity);
//	}
//
//	public UserActivity selectAll(int number) {
//		Optional<UserActivity> useravtivity = userActivityRepositor.findByNumber(number);
//		if (useravtivity.isPresent()) {
//			return useravtivity.get();
//		}
//		return null;
//	}
//
//	public void deleteById(int number) {
//		userActivityRepositor.deleteById(number);
//	}
//}
