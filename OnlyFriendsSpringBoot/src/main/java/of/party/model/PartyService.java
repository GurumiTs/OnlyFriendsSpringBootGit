package of.party.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PartyService {
	
	@Autowired
	private PartyRepository partyRepository;
	
	//新增
	public Party add(Party party) {
		return partyRepository.save(party);
	}
	
	//修改
	public Party update(Party party) {
		return partyRepository.save(party);
	}
	
	//搜尋全部
	public List<Party> selectAll() {
		return partyRepository.findAll();
	}
	
	//單一搜尋
	public Party select(int number) {
		Optional<Party> party = partyRepository.findByNumber(number);
		if(party.isPresent()) {
			return party.get();
		}
		return null;
	}
	
	//刪除
	public void delete(Integer number) {
		partyRepository.deleteById(number);
	}
}
