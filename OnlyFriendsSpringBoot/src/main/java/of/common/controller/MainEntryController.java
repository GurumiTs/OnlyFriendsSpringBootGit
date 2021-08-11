package of.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainEntryController {
	@RequestMapping(path = "/index",method = RequestMethod.GET)
	public String mainEntry() {
		return "index";
	}
	
	@RequestMapping(path = "/login",method = RequestMethod.GET)
	public String loginEntry() {
		return "login";
	}
}
