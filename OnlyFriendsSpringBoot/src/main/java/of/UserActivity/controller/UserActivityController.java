package of.UserActivity.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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

import of.UserActivity.model.UserActivity;
import of.UserActivity.model.UserActivityService;
import of.member.model.Member;
import of.member.model.MemberService;

@Controller
@SessionAttributes(names = { "useractivityList" })
public class UserActivityController {

	@Autowired
	private UserActivity userActivity;

	@Autowired
	private UserActivityService userActivityService;

	@Autowired
	private MemberService memberService;

	// 管理員首頁
	@RequestMapping(path = "/emppActivity.Entry")
	public String userActivityEntry(Model model) {
		List<UserActivity> useractivityList = userActivityService.selectAll();
		model.addAttribute("useractivityList", useractivityList);

		return "useractivepage/empactivemgmt2";
	}
	//管理員資料 json 
	@GetMapping(path = "/Alluseractivity")
	@ResponseBody
	public Map AllActivity(Model model) {
		List<UserActivity> activityList= userActivityService.selectAll();
		Map<String, Object> map=new HashMap<>();
		map.put("data", activityList);
		
		return map;
	}

	// 管理員修改-刪除
	@RequestMapping(path = "/empdeleteactivity.controller", method = RequestMethod.GET)
	public String Delete(@RequestParam(name = "number") int number, Model model) {
		userActivity = userActivityService.select(number);
		model.addAttribute("userActivity", userActivity);
		userActivityService.deleteById(number);
		return "redirect:/emppActivity.Entry";
	}
	// 管理員修改-刪除 json
	@PostMapping(path = "/delete/{number}")
	@ResponseBody
	public String deleteEmployee(@PathVariable("number") String number){
		System.out.println("number"+number);
		userActivityService.deleteById(Integer.parseInt(number));

		return "yes";
	}
	// 管理員修改開放權限
	@PostMapping(path = "/approve")
	@ResponseBody
	public String approve(@RequestParam(name = "number") int number, Model model) {
		System.out.println("controller:number"+number);
		userActivity = userActivityService.select(number);

		String appove = userActivity.getApprove();
		System.out.println(appove);
		if (appove.equals("false")) {
			userActivity.setApprove("true");
			
		} else if (appove.equals("true")) {
			userActivity.setApprove("false");
		}
		userActivityService.updata(userActivity);
		
		return "y";
	}

	// 首頁資料抓取
	@RequestMapping(path = "/useractivityjson", method = RequestMethod.POST)
	@ResponseBody
	public List<UserActivity> userpartymgmtjson(Model m) {
		List<UserActivity> useractivityList = userActivityService.findapporve("true");
		for(UserActivity us:useractivityList) {
			
			System.out.println(us);
		}
		m.addAttribute("useractivityList", useractivityList);

		return useractivityList;
	}

	// 會員參加活動首頁
	@RequestMapping(path = "/useractivity.entry", method = RequestMethod.GET)
	public String userpartymgmtenty(Model m) {
		return "useractivepage/usermgmtjson";
	}

	// 會員活動內頁
	@RequestMapping(path = "/useractivity.page", method = RequestMethod.GET)
	public String userpartyenty(HttpServletRequest request, Model model) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		userActivity = userActivityService.select(number);

		// 進到內頁後see+1
		userActivity.setSee(userActivity.getSee() + 1);
		userActivityService.updata(userActivity);

		model.addAttribute("userActivity", userActivity);

		return "useractivepage/useractivepage";
	}

	// 已報名的內頁
	@RequestMapping(path = "/useractivity.page2", method = RequestMethod.GET)
	public String userpartyenty2(HttpServletRequest request, Model model) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		userActivity = userActivityService.select(number);
		model.addAttribute("userActivity", userActivity);

		return "useractivepage/useractivepage2";
	}

	@RequestMapping(path = "/useractivity.page3", method = RequestMethod.GET)
	public String userpartyenty3(HttpServletRequest request, Model model) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		userActivity = userActivityService.select(number);
		model.addAttribute("userActivity", userActivity);

		return "useractivepage/useractivepage3";
	}
	// 會員首頁分類查詢
//	@RequestMapping(path = "/serchtype", method = RequestMethod.POST)
//	@ResponseBody
//	public List<UserActivity> activitytype(Model model, @RequestParam(name = "type") String type) {
//
//		List<UserActivity> useractivityList = userActivityService.findByType(type);
//
//		model.addAttribute("useractivityList", useractivityList);
//
//		return useractivityList;
//	}

	// 會員新增頁面
	@RequestMapping(path = "/activityadd.controller", method = RequestMethod.GET)
	public String processIntoInsert() {
		return "useractivepage/empty";
	}

	// 會員新增活動
	@RequestMapping(path = "/userInsertActivity.controller", method = RequestMethod.POST)
	public String partadd(@RequestParam(name = "cover") MultipartFile cover,
			@RequestParam(name = "Activityname") String Activityname, @RequestParam(name = "type") String type,
			@RequestParam(name = "time") String time, @RequestParam(name = "time_up") String time_up,
			@RequestParam(name = "county") String county, @RequestParam(name = "district") String district,
			@RequestParam(name = "zipcode") String zipcode, @RequestParam(name = "place") String place,

			@RequestParam(name = "Detail") String Detail, @RequestParam(name = "condition") String condition,
			@RequestParam(name = "man") String man, @RequestParam(name = "woman") String woman,
			HttpServletRequest request, Model m)
			throws SQLException, IllegalStateException, IOException, NullPointerException {

		UserActivity userActivity = new UserActivity();

		String fileName = cover.getOriginalFilename();
		System.out.println("fulename:" + fileName);
		String path = ResourceUtils.getURL("classpath:static/images/partyPic").getPath();
		System.out.println("path:" + path);
		String filePath = path + "/" + fileName;
		File saveFile = new File(filePath);
		cover.transferTo(saveFile);
		System.out.println("step after save");
		userActivity.setCover("images/partyPic/" + fileName);

		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		userActivity.setMemberAccount(memberAccount);

		userActivity.setApprove("false");
		userActivity.setActivityname(Activityname);
		userActivity.setType(type);
		userActivity.setTime(time);

		userActivity.setTime_up(time_up);

		userActivity.setCounty(county);
		userActivity.setCondition(condition);
		userActivity.setDistrict(district);
		userActivity.setZipcode(zipcode);
		userActivity.setPlace(place);

		userActivity.setDetail(Detail);
		userActivity.setCondition(condition);
		userActivity.setMan(Integer.parseInt(man));
		userActivity.setWoman(Integer.parseInt(woman));
		userActivity.setTotal(Integer.parseInt(man) + Integer.parseInt(woman));
		userActivity.setSee(0);

		userActivityService.insert(userActivity);

		System.out.println("活動名稱" + Activityname);
		return "redirect:/useractivity.post";
	}

	// 會員修改
	@RequestMapping(path = "/userActivity.up.controller", method = RequestMethod.GET)
	public String partyupenty(HttpServletRequest request, Model model) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		userActivity = userActivityService.select(number);
		model.addAttribute("userActivity", userActivity);
		return "useractivepage/useractivityup";
	}

	@RequestMapping(path = "/userActivityup.controller", method = RequestMethod.POST)
	public String partup(@RequestParam(name = "cover") MultipartFile cover,
			@RequestParam(name = "activityname") String activityname,
//			@RequestParam(name = "memberAccount") String memberAccount,
			@RequestParam(name = "type") String type, @RequestParam(name = "time") String time,
			@RequestParam(name = "time_up") String time_up, @RequestParam(name = "county") String county,
			@RequestParam(name = "district") String district, @RequestParam(name = "zipcode") String zipcode,
			@RequestParam(name = "place") String place,

			@RequestParam(name = "detail") String detail, @RequestParam(name = "condition") String condition,
			@RequestParam(name = "man") String man, @RequestParam(name = "woman") String woman,

			HttpServletRequest request, Model model)
			throws SQLException, IllegalStateException, IOException, NullPointerException {

		String fileName = cover.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/partyPic").getPath();
		System.out.println(path);
		String filePath = path + "/" + fileName;
		File saveFile = new File(filePath);
		cover.transferTo(saveFile);
		userActivity.setCover("images/partyPic/" + fileName);

		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		userActivity.setMemberAccount(memberAccount);

		userActivity.setActivityname(activityname);
		userActivity.setApprove("false");
		userActivity.setType(type);
		userActivity.setTime(time);
		userActivity.setTime_up(time_up);
		userActivity.setDetail(detail);

		userActivity.setCounty(county);
		userActivity.setCondition(condition);
		userActivity.setDistrict(district);
		userActivity.setZipcode(zipcode);
		userActivity.setPlace(place);

		userActivity.setCondition(condition);
		userActivity.setMan(Integer.parseInt(man));
		userActivity.setWoman(Integer.parseInt(woman));
		userActivity.setTotal(Integer.parseInt(man) + Integer.parseInt(woman));

		userActivityService.updata(userActivity);

		return "redirect:/useractivity.post";
	}

	// 會員刪除
	@RequestMapping(path = "/deleteactivity.controller", method = RequestMethod.GET)
	public String Deleteactivity(@RequestParam(name = "number") int number, Model model) {
//		Integer number = Integer.parseInt(request.getParameter("number"));
		userActivity = userActivityService.select(number);
		model.addAttribute("userActivity", userActivity);
		userActivityService.deleteById(number);
		return "redirect:/useractivity.post";
	}

	// 會員查看POST首頁
	@RequestMapping(path = "/useractivity.post", method = RequestMethod.GET)
	public String userActivityPost(Model m) {
		return "useractivepage/useractivepost";
	}

	// 會員查看創辦活動
	@RequestMapping(path = "/userpost", method = RequestMethod.POST)
	@ResponseBody
	public List<UserActivity> useractivity(Model model, HttpServletRequest request) {

		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();

		List<UserActivity> useractivityList = userActivityService.findByAccount(memberAccount);

		model.addAttribute("useractivityList", useractivityList);

		return useractivityList;
	}

	// 會員參加活動
	@RequestMapping(path = "/addactivity", method = RequestMethod.GET)
//	@ResponseBody
	public String addactivity(HttpServletRequest request, @RequestParam(name = "number") Integer number) {

		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
//		add member
		Member m2 = memberService.findByMemberAccount(memberAccount);

		// 尋找活動
		UserActivity ua = userActivityService.select(number);

		List<Member> par = ua.getParticipate();
		par.add(m2);
		userActivityService.updata(ua);

		// 判斷是否增加成功
		return "useractivepage/usermgmtjson";
	}

	// 會員查詢自己參加活動
//	抓參加者值
	@RequestMapping(path = "/AlreadyParticipated", method = RequestMethod.POST)
	@ResponseBody
	public List<UserActivity> userparty(Model model, HttpServletRequest request) {

		// 先找到使用著帳號
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		System.out.println("會員參加活動");
//		使用帳號在 participate 找到使用著有參加哪些活動
		List<Integer> activitynumber = userActivityService.findByparticipate(Integer.parseInt(memberAccount));

		System.out.println("number" + activitynumber);
		List<UserActivity> activity = new ArrayList<UserActivity>();

		for (Integer num : activitynumber) {
			UserActivity ac = userActivityService.select(num);
			activity.add(ac);
		}
//		userActivityService.f

		return activity;
	}

}
