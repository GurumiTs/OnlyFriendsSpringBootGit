package of.oamember.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.oamember.model.OaMember;
import of.oamember.model.OaMemberService;

@Controller
@SessionAttributes(names= {"alloaMember"})
public class OaMemberController {

	@Autowired
	private OaMember oaMember;
	
	@Autowired 
	
	private OaMemberService oamService;
	
	
	//進個人頁Controller
	
	
//	@GetMapping ("/oaforuserpages.controller")
//	public String oaforuserEntry() {
//		return "officialactivepages/oaforuser";
//	}
	
	@GetMapping(path="/oamemberalljson")
	@ResponseBody
	public Map allOaMemberToJson(Model m) {
		List<OaMember> oamList = oamService.findAll();
		Map<String,Object> map = new HashMap<>();
		map.put("data", oamList);
		return map;
		
	
		
	}
}
