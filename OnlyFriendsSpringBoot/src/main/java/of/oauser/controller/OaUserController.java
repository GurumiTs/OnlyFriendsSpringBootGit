package of.oauser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import of.officialactive.model.OfficialActive;
import of.officialactive.model.OfficialActiveService;

@Controller
public class OaUserController {
	@Autowired
	private OfficialActive oa;
	@Autowired
	private OfficialActiveService oaService;
	
	
	@RequestMapping(path = "/oauser.controller")
	public String oausers() {
		return "officialactivepages/oahomepage";
	}
}
