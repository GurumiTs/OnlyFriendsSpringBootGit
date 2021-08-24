package of.UserActivity.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.sql.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import of.UserActivity.model.UserActivity;
import of.UserActivity.model.UserActivityService;
import of.member.model.Member;
import of.party.model.Party;

@Controller
@SessionAttributes(names = { "useractivityList" })
public class UserActivityController {
	
	@Autowired
	private UserActivity userActivity;
	
	@Autowired
	private UserActivityService userActivityService;
	
	//管理員首頁
	@RequestMapping(path = "/emppActivity.Entry")
	public String userActivityEntry(Model model) {
		List<UserActivity> useractivityList = userActivityService.selectAll();
		model.addAttribute("useractivityList",useractivityList);
		
		return "useractivepage/empactivemgmt";
	}
	//管理員修改-刪除
	@RequestMapping(path="/empdeleteactivity.controller" , method = RequestMethod.GET)
	public String Delete(@RequestParam(name = "number")int number,Model model) {
		userActivity=userActivityService.select(number);
		model.addAttribute("userActivity",userActivity);
		userActivityService.deleteById(number);
		return "redirect:/emppActivity.Entry";
	}
	//管理員修改
	//管理員修改開放權限
	
	//首頁資料抓取
	@RequestMapping(path = "/useractivityjson", method = RequestMethod.POST)
	@ResponseBody
	public List<UserActivity> userpartymgmtjson(Model m) {
		List<UserActivity> useractivityList = userActivityService.selectAll();
		m.addAttribute("useractivityList", useractivityList);

		return useractivityList;
	}
	//會員參加活動首頁
	@RequestMapping(path = "/useractivity.entry", method = RequestMethod.GET)
	public String userpartymgmtenty(Model m) {
		return "useractivepage/usermgmtjson";
	}
	
	//會員活動內頁
	@RequestMapping(path = "/useractivity.page", method = RequestMethod.GET)
	public String userpartyenty(HttpServletRequest request, Model model) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		userActivity = userActivityService.select(number);
		model.addAttribute("userActivity", userActivity);
		
		return "useractivepage/activepage";
	}
	
	//會員新增	
	@RequestMapping(path = "/activityadd.controller", method = RequestMethod.GET)
	public String processIntoInsert() {
		return "useractivepage/userinsert";
	}
	
	// 會員新增活動
	@RequestMapping(path = "/userInsertActivity.controller", method = RequestMethod.POST)
	public String partadd(@RequestParam(name = "cover") MultipartFile cover,
			@RequestParam(name = "Activityname") String Activityname,
			@RequestParam(name = "type") String type, 
			@RequestParam(name = "time") String time,
			@RequestParam(name = "time_up") String time_up, 
			@RequestParam(name = "county") String county,
			@RequestParam(name = "district") String district, 
			@RequestParam(name = "zipcode") String zipcode,
			@RequestParam(name = "place") String place,

			@RequestParam(name = "Detail") String Detail,
			@RequestParam(name = "condition") String condition,
			@RequestParam(name = "man") String man,
			@RequestParam(name = "woman") String woman,
			HttpServletRequest request, Model m)
			throws SQLException, IllegalStateException, IOException, NullPointerException {
		
		UserActivity userActivity=new UserActivity();
		
		
		String fileName = cover.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/partyPic").getPath();
		System.out.println(path);
		String filePath =  path+ "/" + fileName;	
		File saveFile = new File(filePath);
		cover.transferTo(saveFile);
		userActivity.setCover("images/partyPic/" + fileName);
		
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		userActivity.setMemberAccount(memberAccount);
		
		userActivity.setApprove("false");
		userActivity.setActivityname(Activityname);
		userActivity.setType(type);
		userActivity.setTime(time);
		
		String Deadline=time_up.replace("T", " / ");
		userActivity.setTime_up(Deadline);
		
		userActivity.setCounty(county);
		userActivity.setCondition(condition);
		userActivity.setDistrict(district);
		userActivity.setZipcode(zipcode);
		userActivity.setPlace(place);

		userActivity.setDetail(Detail);
		userActivity.setCondition(condition);
		userActivity.setMan(Integer.parseInt(man));
		userActivity.setWoman(Integer.parseInt(woman));
		userActivity.setTotal(Integer.parseInt(man)+Integer.parseInt(woman));
		userActivity.setSee(0);

		userActivityService.insert(userActivity);

		System.out.println("活動名稱"+Activityname);
		return "redirect:/useractivity.entry";
	}

}
