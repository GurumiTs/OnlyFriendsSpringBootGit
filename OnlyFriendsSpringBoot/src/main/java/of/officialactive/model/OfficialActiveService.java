package of.officialactive.model;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	public OfficialActive findById(int anum) {
		Optional<OfficialActive> officialActive = officialActiveRepository.findById(anum); 
		return officialActive.get();
	
	}
		
	
	public void deleteById(Integer anum) {
		officialActiveRepository.deleteById(anum);;
	}
}
