package of.officialactive.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import of.common.model.UsersRepository;



@Service
@Transactional
public class OfficialActiveService {

	@Autowired
	private OfficialActiveRepository officialActiveRepository;
	
	@Autowired
	
	private MemberActiveRepository memberActiveRepository;

	
	
	public OfficialActive insert(OfficialActive officialActive) {
		return officialActiveRepository.save(officialActive);
	}

	public OfficialActive update(OfficialActive officialActive) {
	
		return officialActiveRepository.save(officialActive);
	}
	

	public OfficialActive findByAnum(Long anum) {
		  Optional<OfficialActive> officialActive = officialActiveRepository.findByAnum(anum);
		  if(officialActive.isPresent()) {
		   return officialActive.get();
		  }
		  return null;
		 }
	
	public List<OfficialActive> findAll(){
		return officialActiveRepository.findAll();
				
	}
	
	public void deleteById(Long anum) {
		officialActiveRepository.deleteById(anum);;
	}
	
	public void deleteById1(Long anum) {
		memberActiveRepository.deleteById(anum);;
	}
	

	public Page<OfficialActive> findAllByPage(Pageable pageable) {
	
		return officialActiveRepository.findAll(pageable);
	}
	//選擇單筆活動
	public OfficialActive select(Long anum) {
		Optional<OfficialActive> soa = officialActiveRepository.findByAnum(anum);
		System.out.println("if前面");
		if (soa.isPresent()) {
			System.out.println("if裡面");
			return soa.get();	
			}
		return null;
	}
	

	public  void  updateMember(OfficialActive officialActive) {
	
		 officialActiveRepository.save(officialActive);
	}
	
	//在memberactive 找到使用者報名哪些活動
	public List<Long> findByMemAcc(String memberAccount){
		return memberActiveRepository.findByMemAcc(memberAccount);
	}

	
	//依照活動類型查詢
	
	public List<OfficialActive>findByAtype(String atype){
		List<OfficialActive> atypeList = officialActiveRepository.findByAtype(atype);
		return atypeList;
	}
}
