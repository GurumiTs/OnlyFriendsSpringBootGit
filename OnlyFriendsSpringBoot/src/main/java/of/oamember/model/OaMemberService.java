package of.oamember.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class OaMemberService {

	@Autowired
	private OaMemberRepository oamRepository;

	//查全部
	public List<OaMember> findAll(){
		
		return oamRepository.findAll();
		
	}
	
	//透過MemberAccoount查詢
	public List<OaMember> findByMemberAccount(String memberAccount) {
		return oamRepository.findByMemberAccount(memberAccount);
	}
	
	
}
