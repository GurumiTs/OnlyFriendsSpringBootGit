package of.emp.model;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("employeeService")
@Transactional
public class EmployeeService {

	@Autowired
	private EmployeeDao employeeDao;

	public void save(Employee emp) {
		employeeDao.save(emp);
	}
	
	public void saveOrUpdate(Employee employee) {
		employeeDao.saveOrUpdate(employee);
	}

	public boolean isEmail(String empEmail) {
		boolean result = false;
		result = employeeDao.isEmail(empEmail);
		return result;
	}

	public boolean isAccount(String empAccount) {
		boolean result = false;
		result = employeeDao.isAccount(empAccount);
		return result;
	}

	public int updateEmpEmailCheckNum(String to, String empEmailCheckNum) {
		int result = 0;
		result = employeeDao.updateEmpEmailCheckNum(to, empEmailCheckNum);
		return result;
	}

	public String selectEmpEmailCheckNum(String empEmail) {
		String empEmailCheckNum = null;
		empEmailCheckNum = employeeDao.selectEmployee(empEmail).getEmpEmailCheckNum();
		return empEmailCheckNum;
	}
	
	public String selectHashPassword(String empEmail) {
		String hashPassword = null;
		hashPassword = employeeDao.selectEmployee(empEmail).getEmpPassword();
		return hashPassword;
	}

	public Employee selectEmployee(String empEmail) {
		Employee employee = null;
		employee = employeeDao.selectEmployee(empEmail);	
		return employee;
	}
	
	public List<Employee> selectAllEmployee(){
		return employeeDao.selectAllEmployee();
	}
	
	public List<Employee> selectMyTeam(int deptNum){		
		return employeeDao.selectMyTeam(deptNum);
		
	}

	public int updateEmpEmailCheck(Employee employee) {
		int result = 0;
		result = employeeDao.updateEmpEmailCheck(employee);
		return result;
	}
	
	public void delete(String email) {
		employeeDao.delete(email);
	}

}
