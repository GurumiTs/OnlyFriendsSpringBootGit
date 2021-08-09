package of.common.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("usersService")
@Transactional
public class UsersService {
	
	@Autowired
	private UsersDao usersDao;
	
	public boolean isEmail(String email) {
		boolean result = false;
		result = usersDao.isEmail(email);
		return result;
	}
	
	public Users selectUsers(String email) {
		Users users = null;
		users= usersDao.selectUsers(email);	
		return users;
	}
	
	public void save(Users users) {
		usersDao.save(users);
	}
	public void delete(String email) {
		usersDao.delete(email);
	}
	
	public boolean checkEmail(String email) {
		return usersDao.checkEmail(email);
	}

}
