package of.Advertisement.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("advertisementService")
@Transactional
public class AdvertisementService {
	
	@Autowired
	private AdvertisementRepository advertisementRepository;
	
	public Advertisement insert(Advertisement advertisement){
		return advertisementRepository.save(advertisement);
	}
	
	public Advertisement update(Advertisement advertisement) {
		return advertisementRepository.save(advertisement);
    }
	
	public void deleteByadId(Integer adId){
		advertisementRepository.deleteById(adId);
		
	}
	
	public List<Advertisement> findAll() {
		return advertisementRepository.findAll();
	}
	
	public Advertisement findByadId(Integer adId) {
		return advertisementRepository.findByadId(adId);
	}
	
	public List<Advertisement> findByadIdIn(List<Integer> adId){
		return advertisementRepository.findByadIdIn(adId);
	}
	
	public List<Advertisement> findByadCompanyName(String adCompanyName){
		return advertisementRepository.findByadCompanyName(adCompanyName);
	}
	
	public List<Advertisement> findByadCompanyNameLike(String adCompanyName){
		return advertisementRepository.findByadCompanyNameLike(adCompanyName);
	}
	
	public Advertisement findByadName(String adName) {
		return advertisementRepository.findByadName(adName);
	}
	
	public List<Advertisement> findByadNameLike(String adName){
		return advertisementRepository.findByadNameLike(adName);
	}

	public List<Advertisement> findByadCondition(String adCondition){
		return advertisementRepository.findByadCondition(adCondition);
	}

	public List<Advertisement> findByadConditionLike(String adCondition){
	    return advertisementRepository.findByadConditionLike(adCondition);
	}
}

