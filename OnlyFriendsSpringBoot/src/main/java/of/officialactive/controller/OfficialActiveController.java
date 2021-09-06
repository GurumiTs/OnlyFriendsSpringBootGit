package of.officialactive.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import of.member.model.MemberService;
import of.oamember.model.OaMemberService;
import of.officialactive.model.OfficialActive;
import of.officialactive.model.MemberActive;
import of.officialactive.model.MemberActiveRepository;
import of.officialactive.model.OfficialActiveService;

@Controller
@SessionAttributes(names = { "allofficialActive","totalPages","totalElements" })
public class OfficialActiveController {

	
	@Autowired
	private OfficialActiveService officialActiveService;
	@Autowired
	private OfficialActive officialActive;
	@Autowired 
	private OaMemberService oamService;
	@Autowired 
	private MemberService memberService;



	
	@GetMapping(path= "/oatojson")
	@ResponseBody
	public List<OfficialActive> allOaToJson(Model m) {
		List<OfficialActive> oaList = officialActiveService.findAll();
		
		//Map<String, Object> map = new HashMap<>();
		//map.put("data",oaList);
		return oaList;
		
		
		
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
			OfficialActive  officialActive =new OfficialActive();
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
	
	@RequestMapping(path = "/empofficialActiveUpdate.controller", method = RequestMethod.GET)
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
		@PostMapping(path="/empdeleteofficailactive/{anum}")
		@ResponseBody
		public String deleteOfficialActive(@PathVariable("anum") Long anum) {
			
			//officialActive = officialActiveService.findByAnum(anum);
			//System.out.println("幹你娘");
//			officialActiveService.deleteById1(anum);
			//model.addAttribute("officialActive",officialActive);
			officialActiveService.deleteById(anum);
			return"yes";
	
	}
		
		//homepage
		@GetMapping(path = "/oauserpage.controller")
		public String oauserEntry() {
			return "officialactivepages/oahomepage";
			
		}
		
		//分頁顯示
		@PostMapping("/queryalloabypage/{pageNo}")
		@ResponseBody
		public List<OfficialActive> processQueryByPageAction(@PathVariable("pageNo")int pageNo,Model m){
			int pageSize = 6;
					
			Pageable pageable = PageRequest.of(pageNo-1, pageSize);
			Page<OfficialActive> page = officialActiveService.findAllByPage(pageable);
			int totalPages = page.getTotalPages();
			System.out.println(totalPages);
			long totalElements = page.getTotalElements();
			m.addAttribute("totalPages",totalPages);
			m.addAttribute("totalElements", totalElements);
			
			return page.getContent();
		}
		
		//itempage 詳細活動
		
		
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
		
		
		@PostMapping (path = "/addmember/{anum}")
		@ResponseBody
		public String addmember (@PathVariable("anum") String a,HttpServletRequest request) {
			long anum = Long.parseLong(a);
			Member m1 = (Member) request.getSession().getAttribute("personalinfo");
			String memberAccount = m1.getMemberAccount();
			Member m2 = memberService.findByMemberAccount(memberAccount);			
			OfficialActive oa = officialActiveService.select(anum);
			List<Member> memberactive = oa.getMemberactive();
			memberactive.add(m2);
			officialActiveService.updateMember(oa);
			
			return "y";
			
		}
		
		


		
		
		
		// 參加活動
//		
//		@RequestMapping(path = "/addoamember.controller", method = RequestMethod.POST)
//		@ResponseBody
//		public String addoamember(HttpServletRequest request,@RequestParam(name = "anum")long anum ){
//			Member m1 = (Member) request.getSession().getAttribute("personalinfo");
//			String memberAccount = m1.getMemberAccount();
//			
//			Member m2 = memberService.findByMemberAccount(memberAccount);
//			
//			
//			//抓活動
//			
//			OfficialActive oam = officialActiveService.select(anum);
//			
//			List <Member> oamemberList = oam.getMemberactive();
//			oamemberList.add(m2);
//			officialActiveService.update(oam);
//			
//			return "成功123";
//		}
		
		
		
		
}
		
		 
			
			
		
			
			
		

		
//		public String addoaMember(@RequestParam(name = "memberAccount") String memberAccount
//				,@RequestParam(name = "anum" ,required = false) Integer anum) {
//			
//		officialActive.setMemberAccount(memberAccount);
//		officialActive.setAnum(anum);
//		
			
//		}
		
		
	
		
//}
	


			
		

		

		 
			
		
			  
			 
		
		

