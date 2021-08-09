package of.emp.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("employeeDao")
public class EmployeeDao  {

	@Autowired 
	private SessionFactory sessionFactory ;
	
	public Employee selectEmployee(String empEmail) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Employee.class, empEmail);
	}
	
	public List<Employee> selectAllEmployee(){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Employee";
		List<Employee> empList = session.createQuery(hql,Employee.class)
				 						.getResultList();
		return empList;
	}
	
	public List<Employee> selectMyTeam(int deptNum){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Employee where deptNum = : deptNum";
		List<Employee> empList = session.createQuery(hql,Employee.class)
				 						.setParameter("deptNum",deptNum)
				 						.getResultList();
		return empList;
		
	}
	
	public void save(Employee emp) {
		Session session = sessionFactory.getCurrentSession();
		session.save(emp);		
	}
	
	public void saveOrUpdate(Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(employee);	
	}
	
	public boolean isEmail(String empEmail) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Employee where empEmail = :empEmail";
		List<Employee> empList = session.createQuery(hql,Employee.class)
								 .setParameter("empEmail",empEmail)
								 .getResultList();
		if(empList.size() > 0) {
			result = true;
		}
		
		return result;
		
	}
	
	public boolean isAccount(String empAccount) {
		boolean result = false;
		String hql = "from Employee  where empAccount = :empAccount";
		Session session = sessionFactory.getCurrentSession();
		List<Employee> empList = session.createQuery(hql,Employee.class)
								 .setParameter("empAccount",empAccount)
								 .getResultList();
		if(empList.size() > 0) {
			result = true;
		}	
		
		return result;
		
	}
	
	public int updateEmpEmailCheckNum(String to,String empEmailCheckNum) {
		int result = 0;
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Employee set empEmailCheckNum = : empEmailCheckNum where empEmail = :to";
		result = session.createQuery(hql)
						.setParameter("empEmailCheckNum", empEmailCheckNum)
						.setParameter("to",to)
						.executeUpdate();
		
		return result;
	}
	
	public int updateEmpEmailCheck(Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		employee.setEmpEmailCheck(1);
		session.saveOrUpdate(employee);
		return employee.getEmpEmailCheck();
	}
	
	public void delete(String email) {
		Session session = sessionFactory.getCurrentSession();
		Employee emp = session.load(Employee.class, email);
		session.delete(emp);
	}
	

	
	
	
}
