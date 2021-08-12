package of.officialactive.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import of.officialactive.model.OfficialActive;
import of.officialactive.model.OfficialActiveService;

@Controller
@RequestMapping(path="/officialactivepages")
public class OfficialActiveController {
	@Autowired
	private OfficialActiveService oaService;
	
	@GetMapping(path="officialactivepages/officialactivpinsertmgmt")
	public String processFindAll() {
		return "officialactivepages/officialactivpinsertmgmt";
	}
	@PostMapping(path = "/officialactivpinsertmgmt")
	public OfficialActive processFindById(@RequestParam("anum")int anum) {
		return oaService.findByAnum(anum);
	}
	@PostMapping(path="/officialactivepages/officialactivpinsert")
	public OfficialActive processInesrt(@RequestBody OfficialActive oa) {
		
		return oaService.insert(oa);
	}
	@PostMapping(path="/officialactivepages/officialactivupdate")
	public OfficialActive processUpdate(@RequestBody OfficialActive oa) {
		return oaService.update(oa);
	}
	
	@PostMapping(path="/officialcativepages/officialactivpinsertmgmt")
	public void processActionDelete(@RequestParam("anum")int anum) {
		oaService.deleteById(anum);
		}
		
	
	}

