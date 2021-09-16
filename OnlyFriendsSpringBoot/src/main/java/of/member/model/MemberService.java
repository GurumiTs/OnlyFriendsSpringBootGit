package of.member.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;

	public Member insert(Member member) {
		return memberRepository.save(member);
	}
	public Member update(Member member) {
		return memberRepository.save(member);
	}
	public void deleteById(String email) {
		memberRepository.deleteById(email);
	}
	public Member findByMemberAccount(String account) {
		Optional<Member> employeeOptional = memberRepository.findByMemberAccount(account);
		return employeeOptional.get();
	}
	public List<Member> findAll() {
		return memberRepository.findAll();
	}
	
	public List<Member> findByMemberNameLike(String text){
		return memberRepository.findByMemberNameLike(text);
	}
	
	public List<Member> memberAge(String a,String b){
		return memberRepository.memberAge(a, b);
	}
	
	public List<Member> memberAllow(Integer allow){
		return memberRepository.memberAllowOrNot(allow);
	}
	


}
