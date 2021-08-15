package of.blog.model;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BlogService {
	
	private BlogRepository blogRepository;
	
	public BlogBean insertBlog(BlogBean bBean) {
		return blogRepository.save(bBean);
	}
	
	public BlogBean updateBlog(BlogBean bBean) {
		return blogRepository.save(bBean);
	}
	
	public void deleteById(Integer articleID) {
		blogRepository.deleteById(articleID);
	}
	
	public BlogBean findByArticleID(Integer articleId) {
		Optional<BlogBean> bRep = blogRepository.findById(articleId);
		if (bRep.isPresent()) {
			return bRep.get();
		}
		return null;
	}
	
	public List<BlogBean> findAll(){
		return blogRepository.findAll();
	}
	
}
