package of.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.blog.model.BlogBean;
import of.blog.model.BlogService;

@Controller
public class BlogController {

	@Autowired
	private BlogService bService;
	@Autowired
	private BlogBean blog;
	
	// 進主頁controller
	@RequestMapping(path = "/blogmgmt.controller", method = RequestMethod.GET)
	public String blogMgmtEntry(Model model) {
		return "blogpages/blogmgmt";
	}
	
	@GetMapping(path = "/blogalltojson")
	@ResponseBody
	public Map allBlogToJson(Model m) {
		System.out.println("1");
		List<BlogBean> blogList = bService.findAll();
		System.out.println("2");
		Map<String, Object> map = new HashMap<>();
		System.out.println("3");
		map.put("data", blogList);
		return map;
	}
	
	//　Query
	@PostMapping(path = "/blogquery")
	@ResponseBody
	public BlogBean processQueryById(@RequestParam(name = "articleID") Integer Id) {
		BlogBean blog = bService.findByArticleID(Id);
		return blog;
	}
	
}
