package of.emp.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import of.member.model.Member;

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
	
	public Page<Employee> findAllByPage(Pageable pageable){
		return employeeRepository.findAll(pageable);
	}
	
	public List<Employee> empDeleteOrNot(Integer empdelete){
		return employeeRepository.empDeleteOrNot(empdelete);
	}

}
