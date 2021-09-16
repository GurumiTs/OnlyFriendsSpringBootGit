package of.emp.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import of.member.model.Member;

public interface EmployeeRepository extends JpaRepository<Employee, String> {
	Optional<Employee> findByEmpEmail(String email);
	
	@Query(value = "select * from Employee where empdelete = ?1",nativeQuery = true)
	public List<Employee> empDeleteOrNot(Integer empdelete);
}
