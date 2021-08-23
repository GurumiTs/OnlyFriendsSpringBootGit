//package of.UserActivity.controller;
//
//import java.io.File;
//import java.io.IOException;
//import java.sql.SQLException;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.util.ResourceUtils;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//
//import of.UserActivity.model.UserActivity;
//import of.UserActivity.model.UserActivityService;
//import of.member.model.Member;
//import of.party.model.Party;
//
//@Controller
//public class UserActivityController {
//	
//	@Autowired
//	private UserActivity userActivity;
//	
//	@Autowired
//	private UserActivityService userActivityService;
//	
//	@RequestMapping(path = "/partyadd.controller", method = RequestMethod.GET)
//	public String processIntoInsert() {
//		return "partypages/partyadd";
//	}
//	
//	// 新增會員活動
//	@RequestMapping(path = "/userActivity.controller", method = RequestMethod.POST)
//	public String partadd(@RequestParam(name = "cover") MultipartFile cover,
//			@RequestParam(name = "Activityname") String Activityname,
//			@RequestParam(name = "type") String type, 
//			@RequestParam(name = "time") String time,
//			@RequestParam(name = "time_up") String time_up, 
//			@RequestParam(name = "county") String county,
//			@RequestParam(name = "district") String district, 
//			@RequestParam(name = "zipcode") String zipcode,
//			@RequestParam(name = "place") String place,
//
//			@RequestParam(name = "Detail") String Detail,
//			@RequestParam(name = "condition") String condition,
//			@RequestParam(name = "man") String man,
//			@RequestParam(name = "woman") String woman,
//			HttpServletRequest request, Model m)
//			throws SQLException, IllegalStateException, IOException, NullPointerException {
//		
//		String fileName = cover.getOriginalFilename();
//		String path = ResourceUtils.getURL("classpath:static/images/partyPic").getPath();
//		System.out.println(path);
//		String filePath =  path+ "/" + fileName;	
//		File saveFile = new File(filePath);
//		cover.transferTo(saveFile);
//		userActivity.setCover("images/partyPic/" + fileName);
//		
//		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
//		String memberAccount = m1.getMemberAccount();
////		userActivity.setMemberAccount(memberAccount);
//		
//		userActivity.setApprove(false);
//		userActivity.setActivityname(Activityname);
//		userActivity.setType(type);
//		userActivity.setTime(time);
//		userActivity.setTime_up(time_up);
//		userActivity.setCounty(county);
//		userActivity.setCondition(condition);
//		userActivity.setDistrict(district);
//		userActivity.setZipcode(zipcode);
//		userActivity.setPlace(place);
//
//		userActivity.setDetail(Detail);
//		userActivity.setCondition(condition);
//		userActivity.setMan(Integer.parseInt(man));
//		userActivity.setWoman(Integer.parseInt(woman));
//		userActivity.setTotal(Integer.parseInt(man)+Integer.parseInt(woman));
//		userActivity.setSee(0);
//
//		userActivityService.insert(userActivity);
//
//		System.out.println("活動名稱"+Activityname);
//		return "redirect:/emppartymgmt.controller";
//	}
//
//}
