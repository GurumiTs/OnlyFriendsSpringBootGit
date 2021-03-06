package of.blogusers.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BlogUserService {

	@Autowired
	private BlogUserRepository bUserRepository;

	public BlogUser insertBlogUser(BlogUser blogUser) {
		return bUserRepository.save(blogUser);
	}

	public BlogUser updateBlogUser(BlogUser blogUser) {
		return bUserRepository.save(blogUser);
	}

	public void deleteById(Integer usersArticleID) {
		bUserRepository.deleteById(usersArticleID);
	}

	// 查全部
	public List<BlogUser> findAll() {
		return bUserRepository.findAll();
	}

	// 透過memberAccount查詢
	public List<BlogUser> findByMemberAccount(String memberAccount) {
		return bUserRepository.findByMemberAccount(memberAccount);
	}

	// 透過ID查詢
	public BlogUser findByArticleID(Integer usersArticleID) {
		Optional<BlogUser> bRep = bUserRepository.findById(usersArticleID);
		if (bRep.isPresent()) {
			return bRep.get();
		}
		return null;
	}

	// 確認id存在
	public Boolean checkArticleID(Integer usersArticleID) {
		Optional<BlogUser> bOptional = bUserRepository.findById(usersArticleID);
		return bOptional.isPresent();
	}
	
	// 確認id存在
//	public Boolean checkArticleID(Integer memberAccount) {
//		Optional<BlogUser> bOptional = bUserRepository.findById(memberAccount);
//		return bOptional.isPresent();
//	}

	// pageable
	public Page<BlogUser> findAllByPage(Pageable pageable) {
		return bUserRepository.findAll(pageable);
	}
	
	// pageable
	public Page<BlogUser> findAllByBlogAuthority(String blogAuthority, Pageable pageable) {
		return bUserRepository.findAllByBlogAuthority(blogAuthority, pageable);
	}
	

}
