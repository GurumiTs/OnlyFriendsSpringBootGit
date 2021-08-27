package of.officialactive.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import of.member.model.Member;
import of.member.model.MemberRepository;
import of.officialactive.model.OfficialActive;
import of.officialactive.model.OfficialActiveService;

@Controller
@SessionAttributes(names = { "allofficialActive" })
public class OfficialActiveController {

	@Autowired
	private OfficialActiveService officialActiveService;
	@Autowired
	private OfficialActive officialActive;
	
	@GetMapping(path= "/oatojson")
	@ResponseBody
	public Map allOaToJson(Model m) {
		List<OfficialActive> oaList = officialActiveService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("data",oaList);
		return map;
		
		
		
	}
	

	@RequestMapping(path = "/empofficialactivemgmt.controller", method = RequestMethod.GET)
	public String singupempEntry(Model model) {
		List<OfficialActive> allofficialActive = officialActiveService.findAll();
		model.addAttribute("allofficialActive", allofficialActive);
		return "officialactivepages/officialactivemgmt";
	}

	@RequestMapping(path = "/empofficialactiveform.controller", method = RequestMethod.GET)
	public String processIntoInsert() {
		return "officialactivepages/officialactiveinsert";
	}

	@RequestMapping(path = "/empofficialActiveInsert.controller", method = RequestMethod.POST)
	public String officialActiveAdd(@RequestParam(name = "activeFile") MultipartFile img,
			@RequestParam(name = "empAcc") String empAcc, @RequestParam(name = "aname") String aname,
		    @RequestParam(name = "atype") String atype,@RequestParam(name = "anum" ,required = false) Integer anum,
			@RequestParam(name = "atype2") String atype2, @RequestParam(name = "adate") String adate,
			@RequestParam(name = "startDeadline") String startDeadline,
			@RequestParam(name = "finishDeadline") String finishDeadline, @RequestParam(name = "active") String active,
			@RequestParam(name = "county") String county, @RequestParam(name = "district") String district,
			@RequestParam(name = "conditions") String conditions, @RequestParam(name = "male") String male,
			@RequestParam(name = "female") String female, Model model, HttpServletRequest request)
			throws SQLException, IllegalStateException, IOException {

		String fileName = img.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/empPic").getPath();
		System.out.println(path);
		String filePath =  path+ "/" + fileName; 
		File saveFile = new File(filePath);
	    img.transferTo(saveFile);
	    officialActive.setImg("images/empPic/" + fileName);
		officialActive.setEmpAcc(empAcc);
		officialActive.setAname(aname);
		officialActive.setAtype(atype);
		officialActive.setAtype2(atype2);
		officialActive.setAdate(adate);
		officialActive.setStartDeadline(startDeadline);
		officialActive.setFinishDeadline(finishDeadline);
		officialActive.setActive(active);
		officialActive.setCounty(county);
		officialActive.setDistrict(district);
		officialActive.setConditions(conditions);
		officialActive.setMale(male);
		officialActive.setFemale(female);
		officialActiveService.insert(officialActive);
		return "redirect:/empofficialactivemgmt.controller";
	}
		
	
	//修改
	
	@RequestMapping(path = "/empofficialactivesaveorupdate.controller", method = RequestMethod.GET)
	public String processIntoUpdate(HttpServletRequest request,Model model) {
		Long anum = Long.parseLong(request.getParameter("anum"));
		officialActive = officialActiveService.findByAnum(anum);
		model.addAttribute("officialActive",officialActive);
		return "officialactivepages/officialactiveupdate";
	}
	
	@RequestMapping(path = "/empofficialActiveUpdate.controller", method = RequestMethod.POST)
	public String officialActiveUpdate(@RequestParam(name = "activeFile") MultipartFile img,
			@RequestParam(name = "empAcc") String empAcc, @RequestParam(name = "aname") String aname,
		    @RequestParam(name = "atype") String atype,@RequestParam(name = "anum" ,required = false) Integer anum,
			@RequestParam(name = "atype2") String atype2, @RequestParam(name = "adate") String adate,
			@RequestParam(name = "startDeadline") String startDeadline,
			@RequestParam(name = "finishDeadline") String finishDeadline, @RequestParam(name = "active") String active,
			@RequestParam(name = "county") String county, @RequestParam(name = "district") String district,
			@RequestParam(name = "conditions") String conditions, @RequestParam(name = "male") String male,
			@RequestParam(name = "female") String female, Model model, HttpServletRequest request)
			throws SQLException, IllegalStateException, IOException {
		
		try {
			
		
		String fileName = img.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/empPic").getPath();
		System.out.println(path);
		String filePath =  path+ "/" + fileName; 
		File saveFile = new File(filePath);
	    img.transferTo(saveFile);
	    officialActive.setImg("images/empPic/" + fileName);
		officialActive.setEmpAcc(empAcc);
		officialActive.setAname(aname);
		officialActive.setAtype(atype);
		officialActive.setAtype2(atype2);
		officialActive.setAdate(adate);
		officialActive.setStartDeadline(startDeadline);
		officialActive.setFinishDeadline(finishDeadline);
		officialActive.setActive(active);
		officialActive.setCounty(county);
		officialActive.setDistrict(district);
		officialActive.setConditions(conditions);
		officialActive.setMale(male);
		officialActive.setFemale(female);
		
		officialActiveService.update(officialActive);
		
		List<OfficialActive> officialActiveList = officialActiveService.findAll();
		
				model.addAttribute("officialActiveList",officialActiveList);
				return "redirect:/empofficialactivemgmt.controller";
		}catch (Exception e) {
			model.addAttribute("error!");
			return "redirect:/empofficialactivemgmt.controller";
		}
		
		}
	
		
		//刪除
		@RequestMapping(path="/empdeleteofficailactive.controller" , method = RequestMethod.GET)
		public String deleteOfficialActive(@RequestParam(name = "anum") Long anum, Model model) {
			System.out.println(anum);
			officialActive = officialActiveService.findByAnum(anum);
			System.out.println(officialActive);
			model.addAttribute("officialActive",officialActive);
			officialActiveService.deleteById(anum);
			return"redirect:/empofficialactivemgmt.controller";
	
	}
		
		//homepage
		@GetMapping(path = "/oauserpage.controller")
		public String oauserEntry() {
			return "officialactivepages/oahomepage";
			
		}
		
		@PostMapping("/queryalloabypage/{pageNo}")
		@ResponseBody
		public List<OfficialActive> processQueryByPageAction(@PathVariable("pageNo")int pageNo,Model m){
			int pageSize = 3;
					
			Pageable pageable = PageRequest.of(pageNo-1, pageSize);
			Page<OfficialActive> page = officialActiveService.findAllByPage(pageable);
			int totalPages = page.getTotalPages();
			long totalElements = page.getTotalElements();
			m.addAttribute("totalPages",totalPages);
			m.addAttribute("totalElements", totalElements);
			
			return page.getContent();
		}
		
		//itempage

		@GetMapping("/oaitemEntry.controller")
		public String oaItemEntry(@RequestParam long anum) {
			System.out.println(anum);
			return "officialactivepages/oaitem";

		}
		
		@GetMapping("/oaitem.controller")
		@ResponseBody
		public List<OfficialActive> oaItem(){
			List<OfficialActive> oa = officialActiveService.findAll();
			return oa;
			
		}
		
		
		//oaforuserpages home
		
		@GetMapping ("/oaforuserpages.controller")
		public String oaforuserEntry() {
			return "officialactivepages/oaforuser";
		}
		
		
	//	@RequestMapping(path = "/oamember" , method= RequestMethod.POST)
		//@ResponseBody
		//public List<OaMember> OaMember(){	
		// Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		// String memberAccount = m1.getMemberAccount();
		}
//		
//		@RequestMapping(path = "/userpost",method = RequestMethod.POST)
//		 @ResponseBody
//		 public List<UserActivity> useractivity(Model model, HttpServletRequest request) {
//
//		  Member m1 = (Member) request.getSession().getAttribute("personalinfo");
//		  String memberAccount = m1.getMemberAccount();
//
//		  List<UserActivity> useractivityList = userActivityService.findByAccount(memberAccount);
//
//		  model.addAttribute("useractivityList", useractivityList);
//
//		  return useractivityList;
		 
					
		

//		 }
			
		
			  
			 
		
		

