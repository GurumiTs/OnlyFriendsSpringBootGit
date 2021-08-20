package of.officialactive.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional
public class OfficialActiveService {

	@Autowired
	private OfficialActiveRepository officialActiveRepository;
	
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

	public Page<OfficialActive> findAllByPage(Pageable pageable) {
	
		return officialActiveRepository.findAll(pageable);
	}
}
