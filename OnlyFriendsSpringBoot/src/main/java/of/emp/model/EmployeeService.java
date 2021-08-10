package of.emp.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;

	public Employee insert(Employee employee) {
		return employeeRepository.save(employee);
	}
	public Employee update(Employee employee) {
		return employeeRepository.save(employee);
	}
	public void deleteById(String email) {
		employeeRepository.deleteById(email);
	}
	public Employee findByEmpEmail(String email) {
		Optional<Employee> employeeOptional = employeeRepository.findByEmpEmail(email);
		return employeeOptional.get();
	}
	public List<Employee> findAll() {
		return employeeRepository.findAll();
	}

}
