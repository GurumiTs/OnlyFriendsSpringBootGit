package of.officialactive.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
import of.officialactive.model.OfficialActive;
import of.officialactive.model.OfficialActiveService;

@Controller
@SessionAttributes(names = { "allofficialActive","totalPages","totalElements" })
public class OfficialActiveController {

	
	@Autowired
	private OfficialActiveService officialActiveService;
	@Autowired
	private OfficialActive officialActive;
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
	
	//查詢單筆活動
	@PostMapping(path="/empfindanum")
	@ResponseBody
	public OfficialActive findOfficialActive(@RequestParam("anum") Long anum) {
		
		//officialActive = officialActiveService.findByAnum(anum);
//		officialActiveService.deleteById1(anum);
		//model.addAttribute("officialActive",officialActive);
		OfficialActive foa = officialActiveService.findByAnum(anum);
		
		
		return foa;
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
			@RequestParam(name = "county") String county, @RequestParam(name = "district") String district,@RequestParam(name = "address") String address,
			@RequestParam(name = "conditions") String conditions, @RequestParam(name = "male") String male,
			@RequestParam(name = "female") String female, Model model, HttpServletRequest request)
			throws SQLException, IllegalStateException, IOException {
			OfficialActive  officialActive =new OfficialActive();
		String fileName = img.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/officialactivePic").getPath();
		System.out.println(path);
		String filePath =  path+ "/" + fileName; 
		File saveFile = new File(filePath);
	    img.transferTo(saveFile);
	    officialActive.setImg("images/officialactivePic/" + fileName);
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
		officialActive.setAddress(address);
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
			@RequestParam(name = "address") String address,
			@RequestParam(name = "conditions") String conditions, @RequestParam(name = "male") String male,
			@RequestParam(name = "female") String female, Model model, HttpServletRequest request)
			throws SQLException, IllegalStateException, IOException {
			
		
			
		
		String fileName = img.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/officialactivePic").getPath();
		System.out.println(path);
		String filePath =  path+ "/" + fileName; 
		File saveFile = new File(filePath);
	    img.transferTo(saveFile);
	    officialActive.setImg("images/officialactivePic/" + fileName);
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
		officialActive.setAddress(address);
		officialActive.setConditions(conditions);
		officialActive.setMale(male);
		officialActive.setFemale(female);
		
		
		officialActiveService.update(officialActive);
		List<OfficialActive> officialActiveList = officialActiveService.findAll();
		model.addAttribute("officialActiveList",officialActiveList);
		
		return "officialactivepages/officialactivemgmt";
		
		
		
	}
		
		//刪除
		@PostMapping(path="/empdeleteofficailactive/{anum}")
		@ResponseBody
		public String deleteOfficialActive(@PathVariable("anum") Long anum) {
			
			//officialActive = officialActiveService.findByAnum(anum);
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
		
		
		
		
		@RequestMapping ("/oaforuserpages")
		public String oaforuserEntry() {
			
			return "officialactivepages/oaforuser";

		}
		
		@GetMapping("/oaforuserpages.controller")
		@ResponseBody
		public List<OfficialActive> oaforuser(HttpServletRequest request) {
			Member m1 = (Member) request.getSession().getAttribute("personalinfo");
			String memberAccount = m1.getMemberAccount();
			List<Long> oanaum = officialActiveService.findByMemAcc(memberAccount);


			
			List<OfficialActive> oaList = new ArrayList<OfficialActive>();
			
			for(Long anum : oanaum) {
				OfficialActive ac = officialActiveService.select(anum);
				oaList.add(ac);
			}
			
			return oaList;
		}
		
		//取得會員編號加入活動
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
		
		//會員退出活動
		
		
		@PostMapping(path="/memberactivedelete/{anum}")
		@ResponseBody
		public String deleteMemberActive (@PathVariable("anum") String a,HttpServletRequest request) {
			long anum = Long.parseLong(a);
			Member m1 = (Member) request.getSession().getAttribute("personalinfo");
			String memberAccount = m1.getMemberAccount();
			Member m2 = memberService.findByMemberAccount(memberAccount);			
			OfficialActive oa = officialActiveService.select(anum);
			List<Member> memberactive = oa.getMemberactive();
			
			System.out.println(m2);
			System.out.println(anum);
			memberactive.remove(m2);
			officialActiveService.update(oa);
			
			
			
			return"yes";
		}
		
		
		//依照活動類型查詢 
		@PostMapping(path="/findbyatype1")
		@ResponseBody
		public List<OfficialActive> findByAtype(){
			List<OfficialActive> atypeList = officialActiveService.findByAtype("多人團體活動#戶外");
			return atypeList;
		
		}
		@PostMapping(path="/findbyatype2")
		@ResponseBody
		public List<OfficialActive> findByAtype2(){
			List<OfficialActive> atypeList = officialActiveService.findByAtype("多人團體活動#室內");
			System.out.println(atypeList);
			return atypeList;
			
		
		}
		@PostMapping(path="/findbyatype3")
		@ResponseBody
		public List<OfficialActive> findByAtype3(){
			List<OfficialActive> atypeList = officialActiveService.findByAtype("一對一活動#戶外");
			System.out.println(atypeList);
			return atypeList;
		
		}
		@PostMapping(path="/findbyatype4")
		@ResponseBody
		public List<OfficialActive> findByAtype4(){
			List<OfficialActive> atypeList = officialActiveService.findByAtype("一對一活動#室內");
			System.out.println(atypeList);
			return atypeList;
		
		}
	
				
		}

	

			
		

		

		 
			
		
			  
			 
		
		

