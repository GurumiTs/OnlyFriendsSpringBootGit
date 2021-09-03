package of.blogmessage.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FirstMessageService {
	
	@Autowired
	private FirstMessageRepository fMesRepository;
	
	// 新增留言
	public FirstMessage insertMessage(FirstMessage fMessage) {
		return fMesRepository.save(fMessage);
	}
	
	// 修改留言
	public FirstMessage updateMessage(FirstMessage fMessage) {
		return fMesRepository.save(fMessage);
	}
	
	// 刪除留言
	public void deleteByMessageID(Integer messageID) {
		fMesRepository.deleteById(messageID);
	}
	
	// 查詢留言id
	public FirstMessage findByMessagesID(Integer messageID){
		Optional<FirstMessage> fOptional = fMesRepository.findById(messageID);
		if (fOptional.isPresent()) {
			return fOptional.get();
		}
		return null;
	}
	
	// 查全部
	public List<FirstMessage> findAll(){
		return fMesRepository.findAll();
	}
	
}
