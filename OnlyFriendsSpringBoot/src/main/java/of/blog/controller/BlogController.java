package of.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import of.blog.model.BlogBean;
import of.blog.model.BlogService;

@Controller
public class BlogController {

	@Autowired
	private BlogService bService;
	@Autowired
	private BlogBean blog;

	// 進主頁controller
	@RequestMapping(path = "/empblogmgmt.controller", method = RequestMethod.GET)
	public String blogMgmtEntry(Model model) {
		return "blogpages/blogmgmt";
	}

//	@RequestMapping(path = "/blogmgmt.controller", method = RequestMethod.GET)
//	public String signupempEntry(Model model) {
//		List<BlogBean> allBlog = bService.findAll();
//		model.addAttribute("allBlog", allBlog);
//		return "blogpages/blogmgmt";
//	}

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

	// Delete
	@PostMapping(path = "/empblogdelete/{articleID}")
	@ResponseBody
	public String deleteBlog(@PathVariable("articleID") Integer articleID) {
		System.out.println("articleID" + articleID);
		boolean boo = bService.checkArticleID(articleID);
		if (boo) {
			bService.deleteById(articleID);
			return "yes";
		}
			return "fail";
	}

}
