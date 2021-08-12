package of.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import of.blog.model.BlogService;

@Controller
@RequestMapping(path = "/emp")
public class BlogController {

	@Autowired
	private BlogService bService;
	
	
	
}
