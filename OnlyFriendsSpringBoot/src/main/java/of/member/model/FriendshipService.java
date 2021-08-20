//package of.member.model;
//
//import java.util.List;
//import java.util.Optional;
//
//import javax.transaction.Transactional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//@Service
//@Transactional
//public class FriendshipService {
//
//	@Autowired
//	 private FriendshipRepository friendshipRepository;
//	
//		public Friendship insert(Friendship friendship) {
//			return friendshipRepository.save(friendship);
//		}
//		public Friendship update(Friendship friendship) {
//			return friendshipRepository.save(friendship);
//		}
//		public void deleteById(Integer id) {
//			friendshipRepository.deleteById(id);
//		}
//		public Friendship findById(Integer id) {
//			Optional<Friendship> friendshipOptional = friendshipRepository.findById(id);
//			return friendshipOptional.get();
//		}
//		public List<Friendship> findAll() {
//			return friendshipRepository.findAll();
//		}
//		
//}
