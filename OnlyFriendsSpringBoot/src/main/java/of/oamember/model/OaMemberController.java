package of.oamember.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.officialactive.model.OfficialActive;

@Controller
@SessionAttributes(names= {"alloaMember"})
public class OaMemberController {

	

}
@GetMapping(path= "/oatojson")
@ResponseBody
public Map allOaToJson(Model m) {
	List<OfficialActive> oaList = officialActiveService.findAll();
	Map<String, Object> map = new HashMap<>();
	map.put("data",oaList);
	return map;
	
	