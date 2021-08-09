package of.member.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import of.emp.model.Employee;

@Repository("memberDao")
public class MemberDao {
	@Autowired 
	private SessionFactory sessionFactory ;
	
	public Member selectMember(String memberEmail) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Member.class, memberEmail);
	}
	
	public String save(Member member) {
		String id = null;
		Session session = sessionFactory.getCurrentSession();
		id = (String) session.save(member);		
		return id;
	}
	
	public void saveOrUpdate(Member member) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(member);	
	}
	
	public int updateMemberEmailCheckNum(String to,String memberEmailCheckNum) {
		int result = 0;
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Member set memberEmailCheckNum = : memberEmailCheckNum where memberEmail = :to";
		result = session.createQuery(hql)
						.setParameter("memberEmailCheckNum", memberEmailCheckNum)
						.setParameter("to",to)
						.executeUpdate();
		return result;
	}
	
	public int updateMemberEmailCheck(Member member) {
		Session session = sessionFactory.getCurrentSession();
		member.setMemberEmailCheck(1);
		session.saveOrUpdate(member);
		return member.getMemberEmailCheck();
	}

}
