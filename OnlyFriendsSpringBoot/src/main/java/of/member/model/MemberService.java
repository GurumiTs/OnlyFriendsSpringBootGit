package of.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import of.emp.model.Employee;
import of.emp.model.EmployeeDao;

@Service("memberService")
@Transactional
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	
	public Member selectMember(String memberEmail) {
		Member member = null;
		member = memberDao.selectMember(memberEmail);	
		return member;
	}

	public String save(Member member) {
		 return memberDao.save(member);
	}
	public int updateMemberEmailCheckNum(String to, String memberEmailCheckNum) {
		int result = 0;
		result = memberDao.updateMemberEmailCheckNum(to, memberEmailCheckNum);
		return result;
	}
	
	public int updateMemberEmailCheck(Member member) {
		int result = 0;
		result = memberDao.updateMemberEmailCheck(member);
		return result;
	}
	
	public void saveOrUpdate(Member member) {
		memberDao.saveOrUpdate(member);
	}


}
