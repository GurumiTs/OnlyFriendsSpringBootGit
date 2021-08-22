package of.party.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

//import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

//import of.emp.model.Employee;
import of.party.model.Party;
import of.party.model.PartyService;

@Controller
@SessionAttributes(names = { "partyList" })
public class PartyController {

	@Autowired
	private PartyService partyService;
	@Autowired
	private Party party;

	// 會員活動管理首頁
	@RequestMapping(path = "/emppartymgmt.controller", method = RequestMethod.GET)
	public String partyEntry(Model model) {
		List<Party> partyList = partyService.selectAll();
		model.addAttribute("partyList", partyList);

		System.out.println("partyList:" + partyList);
		return "partypages/partymgmt";
	}

	// 進新增controller
	@RequestMapping(path = "/emppartyadd.controller", method = RequestMethod.GET)
	public String processIntoInsert() {
		return "partypages/partyadd";
	}

	// 新增會員活動
	@RequestMapping(path = "/emppartyinsert.controller", method = RequestMethod.POST)
	public String partadd(@RequestParam(name = "cover") MultipartFile cover, @RequestParam(name = "name") String name,
			@RequestParam(name = "type") String type, @RequestParam(name = "time") String time,
			@RequestParam(name = "time_up") String time_up, @RequestParam(name = "county") String county,
			@RequestParam(name = "district") String district, @RequestParam(name = "zipcode") String zipcode,
			@RequestParam(name = "place") String place,

			@RequestParam(name = "plany") String plany, @RequestParam(name = "condition") String condition,
			@RequestParam(name = "man") String man, @RequestParam(name = "woman") String woman,
			HttpServletRequest request, Model m)
			throws SQLException, IllegalStateException, IOException, NullPointerException {
		Party party2 = new Party();
		
		String fileName = cover.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/partyPic").getPath();
		System.out.println(path);
		String filePath =  path+ "/" + fileName;	
		File saveFile = new File(filePath);
		cover.transferTo(saveFile);
		party2.setCover("images/partyPic/" + fileName);
		

		party2.setName(name);
		party2.setType(type);
		party2.setTime(time);
		party2.setTime_up(time_up);
		party2.setCounty(county);
		party2.setCondition(condition);
		party2.setDistrict(district);
		party2.setZipcode(zipcode);
		party2.setPlace(place);

		party2.setPlany(plany);
		party2.setCondition(condition);
		party2.setMan(Integer.parseInt(man));
		party2.setWoman(Integer.parseInt(woman));
		party2.setSee(0);

		partyService.add(party2);

		System.out.println("活動名稱"+name);
		return "redirect:/emppartymgmt.controller";
	}

	// 修改
	@RequestMapping(path = "/emppartyupenty.controller", method = RequestMethod.GET)
	public String partyupenty(HttpServletRequest request, Model model) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		party = partyService.select(number);
		model.addAttribute("party", party);
		return "partypages/partyup";
	}

	@RequestMapping(path = "/emppartyup.controller", method = RequestMethod.POST)
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

		return "redirect:/emppartymgmt.controller";
	}

	// 刪除
	@RequestMapping(path = "/empdeleteparty.controller", method = RequestMethod.POST)
	public String deleteEmployee(@RequestParam(name = "number") String number, Model model) {
		String id = number;
		System.out.println(number);
		partyService.delete(Integer.parseInt(id));

		return "partypages/emppartymgmt";
	}

}

