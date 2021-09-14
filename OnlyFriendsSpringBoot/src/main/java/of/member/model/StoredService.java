package of.member.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class StoredService {
	
	@Autowired
	private StoredRepository storedRepository;

	public Stored insert(Stored stored) {
		return storedRepository.save(stored);
	}
	
	public Float searchtotal(Integer month) {
		Float a = storedRepository.searchtotal(month);
		return a; 
	};
	
	public Float storedannual() {
		return storedRepository.storedannual();
	}
	
	public Float memberstoredtotal(String memberAccount) {
		return storedRepository.memberstoredtotal(memberAccount);
	}
	
	public List<Stored> findAll(){
		return storedRepository.findAll(Sort.by("orderTime").ascending());
	}


}
