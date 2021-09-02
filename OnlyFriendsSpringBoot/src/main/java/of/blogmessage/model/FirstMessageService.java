package of.blogmessage.model;

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
	
	
}
