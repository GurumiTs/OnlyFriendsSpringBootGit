package of.blog.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import of.blogusers.model.BlogUser;

@Service
@Transactional
public class BlogService {
	
	@Autowired
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
	
	public Boolean checkArticleID(Integer articleId) {
		Optional<BlogBean> bOptional = blogRepository.findById(articleId);
		return bOptional.isPresent();
	}
	
	// pageable
	public Page<BlogBean> findAllByPage(Pageable pageable) {
		return blogRepository.findAll(pageable);
	}
	
	public List<BlogBean> findByBlogType(String blogType){
		List<BlogBean> blogTypeList = blogRepository.findByBlogType(blogType);
		return blogTypeList;
	}
		
}
