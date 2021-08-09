package of.common.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import of.emp.model.Employee;

@Repository("usersDao")
public class UsersDao {

	@Autowired 
	private SessionFactory sessionFactory ;
	public boolean isEmail(String email) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Users where email = :email";
		List<Users> empList = session.createQuery(hql,Users.class)
								 .setParameter("email",email)
								 .getResultList();
		if(empList.size() > 0) {
			result = true;
		}
		return result;		
	}
	
	public Users selectUsers(String email) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Users.class, email);
	}
	
	public void save(Users users) {
		Session session = sessionFactory.getCurrentSession();
		session.save(users);		
	}
	
	public void delete(String email) {
		Session session = sessionFactory.getCurrentSession();
		Users users = session.load(Users.class, email);
		session.delete(users);
	}
	
	public boolean checkEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		String hql = " from Users where email = : email" ;
		Query<Users> query = session.createQuery(hql,Users.class);
		query.setParameter("email",email);
		Users result = query.uniqueResult();
		if(result!=null) {
			return true;
		}
		return false;
	}
}
