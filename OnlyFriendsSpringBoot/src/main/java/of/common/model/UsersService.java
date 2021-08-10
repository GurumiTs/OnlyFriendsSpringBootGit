package of.common.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import of.emp.model.Employee;
import of.emp.model.EmployeeRepository;

@Service
@Transactional
public class UsersService {
	
	@Autowired
	private UsersRepository usersRepository;

	public Users insert(Users users) {
		return usersRepository.save(users);
	}

	public void deleteById(String email) {
		usersRepository.deleteById(email);
	}
	
	public boolean checkEmail(String email) {
		Optional<Users> usersOptional = usersRepository.findByEmail(email);
		return usersOptional.isPresent();
	}
	
	public Users findByEmail(String email) {
		Optional<Users> usersOptional = usersRepository.findByEmail(email);
		return usersOptional.get();
	}
	
	
}
