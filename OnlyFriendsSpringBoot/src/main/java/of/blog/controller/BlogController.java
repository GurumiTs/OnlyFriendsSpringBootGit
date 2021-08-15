package of.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.blog.model.BlogBean;
import of.blog.model.BlogService;

@Controller
@RequestMapping(path = "/emp")
@SessionAttributes(names = { "allBlog", "blog" })
public class BlogController {

	@Autowired
	private BlogService bService;
	@Autowired
	private BlogBean blog;
	
	@RequestMapping(path = "/blogalltojson", method = RequestMethod.GET)
	public Map signupempEntry() {
		List<BlogBean> allBlog = bService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("data", allBlog);
		return map;
	}
	
	//　Query
	@PostMapping(path = "/query")
	@ResponseBody
	public BlogBean processQueryById(@RequestParam("bid") Integer big) {
		return bService.findByArticleID(big);
	}
	
}
