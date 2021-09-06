package of.common.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import of.member.model.Member;

@Service
@Transactional
public class FriendshipService {
	@Autowired
	private FriendshipRepository friendshipRepository;
	
	public Integer chatnum(String username,String selectUser) {
		return friendshipRepository.chatnum(username, selectUser);
	}
	
	public List<Integer> mychatnum(String username){
		return friendshipRepository.mychatnum(username);
	}
	
	public void updatechatnum(Integer chatnum,String username,String selectUser) {
		 friendshipRepository.updatechatnum(chatnum,username, selectUser);
	}

}
