package of.Advertisement.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AdvertisementRepository extends JpaRepository<Advertisement, Integer> {
	
	public Advertisement findByadId(Integer adId);
	
	public List<Advertisement> findByadIdIn(List<Integer> adId);
	
	public List<Advertisement> findByadCompanyName(String adCompanyName);
	
	public List<Advertisement> findByadCompanyNameLike(String adCompanyName);
	
	public Advertisement findByadName(String adName);
	
	public List<Advertisement> findByadNameLike(String adName);

	public List<Advertisement> findByadCondition(String adCondition);

	public List<Advertisement> findByadConditionLike(String adCondition);

	
	
	

}