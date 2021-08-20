package of.party.usercontroller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import of.party.model.Party;
import of.party.model.PartyService;

@Controller
@SessionAttributes(names = { "partyList" })
public class PartyUserController {

	@Autowired
	private PartyService partyService;
	@Autowired
	private Party party;
	
	//首頁
	@RequestMapping(path = "/userparty.entry", method = RequestMethod.GET)
	public String userpartyenty1(Model m) {
		List<Party> partyList = partyService.selectAll();
		m.addAttribute("partyList", partyList);

		System.out.println("partyList:" + partyList);
		return "partyuserpages/usermgmt";
	}
	//內頁	
	@RequestMapping(path = "/userparty.page", method = RequestMethod.GET)
	public String  userparty2(HttpServletRequest request, Model model) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		party = partyService.select(number);
		model.addAttribute("party", party);
		
		return "partyuserpages/example";
	}
	//模糊搜尋
	
	//各類活動類型
	

	// 會員活動管理首頁
	@RequestMapping(path = "/userpartymgmt.controller", method = RequestMethod.GET)
	public String partyEntry(Model model) {
		List<Party> partyList = partyService.selectAll();
		model.addAttribute("partyList", partyList);

		System.out.println("partyList:" + partyList);
		return "";
	}

	
	
	// 進新增頁面
	@RequestMapping(path = "/userpartyadd.controller", method = RequestMethod.GET)
	public String processIntoInsert() {
		return "";
	}

	// 新增會員活動
	@RequestMapping(path = "/userpartyinsert.controller", method = RequestMethod.POST)
	public String partadd(@RequestParam(name = "cover") MultipartFile cover, @RequestParam(name = "name") String name,
			@RequestParam(name = "type") String type, @RequestParam(name = "time") String time,
			@RequestParam(name = "time_up") String time_up, @RequestParam(name = "county") String county,
			@RequestParam(name = "district") String district, @RequestParam(name = "zipcode") String zipcode,
			@RequestParam(name = "place") String place,

			@RequestParam(name = "plany") String plany, @RequestParam(name = "condition") String condition,
			@RequestParam(name = "man") String man, @RequestParam(name = "woman") String woman,
			HttpServletRequest request, Model m)
			throws SQLException, IllegalStateException, IOException, NullPointerException {
		
		String fileName = cover.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/partyPic").getPath();
		System.out.println(path);
		String filePath =  path+ "/" + fileName;	
		File saveFile = new File(filePath);
		cover.transferTo(saveFile);
		party.setCover("images/partyPic/" + fileName);
		

		party.setName(name);
		party.setType(type);
		party.setTime(time);
		party.setTime_up(time_up);
		party.setCounty(county);
		party.setCondition(condition);
		party.setDistrict(district);
		party.setZipcode(zipcode);
		party.setPlace(place);

		party.setPlany(plany);
		party.setCondition(condition);
		party.setMan(Integer.parseInt(man));
		party.setWoman(Integer.parseInt(woman));
		party.setSee(0);

		partyService.add(party);

		return "redirect:/";
	}

	// 修改
	@RequestMapping(path = "/userpartyupenty.controller", method = RequestMethod.GET)
	public String partyupenty(HttpServletRequest request, Model model) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		party = partyService.select(number);
		model.addAttribute("party", party);
		return "";
	}

	@RequestMapping(path = "/userpartyup.controller", method = RequestMethod.POST)
	public String partup(@RequestParam(name = "cover") MultipartFile cover, @RequestParam(name = "name") String name,
			@RequestParam(name = "type") String type, @RequestParam(name = "time") String time,
			@RequestParam(name = "time_up") String time_up, @RequestParam(name = "county") String county,
			@RequestParam(name = "district") String district, @RequestParam(name = "zipcode") String zipcode,
			@RequestParam(name = "place") String place,

			@RequestParam(name = "plany") String plany, @RequestParam(name = "condition") String condition,
			@RequestParam(name = "man") String man, @RequestParam(name = "woman") String woman,
			HttpServletRequest request, Model m)
			throws SQLException, IllegalStateException, IOException, NullPointerException {
		
		String fileName = cover.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/partyPic").getPath();
		System.out.println(path);
		String filePath =  path+ "/" + fileName;	
		File saveFile = new File(filePath);
		cover.transferTo(saveFile);
		party.setCover("images/partyPic/" + fileName);

		party.setName(name);
		party.setType(type);
		party.setTime(time);
		party.setTime_up(time_up);
		party.setCounty(county);
		party.setCondition(condition);
		party.setDistrict(district);
		party.setZipcode(zipcode);
		party.setPlace(place);

		party.setPlany(plany);
		party.setCondition(condition);
		party.setMan(Integer.parseInt(man));
		party.setWoman(Integer.parseInt(woman));
		party.setSee(0);

		partyService.update(party);

		List<Party> partyList = partyService.selectAll();

		m.addAttribute("partyList", partyList);

		return "";
	}

	// 刪除
	@RequestMapping(path = "/userdeleteparty.controller", method = RequestMethod.POST)
	public String deleteEmployee(@RequestParam(name = "number") String number, Model model) {
		String id = number;
		System.out.println(number);
		partyService.delete(Integer.parseInt(id));

		return "";
	}

}

