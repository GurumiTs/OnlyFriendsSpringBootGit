package of.emp.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import of.common.model.Users;
import of.common.model.UsersService;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;
import of.member.model.Member;
import of.member.model.MemberService;

@Controller
public class EmployeeJsonController {
	@Autowired
	private EmployeeService empService;
	@Autowired
	private Employee employee;
	@Autowired
	private UsersService usersService;
	@Autowired
	private Users users;
	@Autowired
	private MemberService memeberService;

	@GetMapping(path = "/empalltojson")
	@ResponseBody
	public Map allEmployeeToJson(Model m) {
		List<Employee> empList = empService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("data", empList);
		return map;
	}
	
	@PostMapping(path = "/membersum")
	@ResponseBody
	public Integer memberSum(Model m) {
		List<Member> memberList = memeberService.findAll();
		Integer membersum = memberList.size();
		return membersum;
	}
	
//	@PostMapping(path = "/alltojsonarray")
//	@ResponseBody
//	public List<Employee> allEmployeeToJsonArray(Model m) {
//		List<Employee> empList = empService.findAll();	
//		return empList;
//	}

	@PostMapping(path = "/empquery")
	@ResponseBody
	public Employee processRestQueryEmployee(@RequestParam(name = "email") String email) {
		Employee employee = empService.findByEmpEmail(email);
		return employee;
	}

	@RequestMapping(path = "/empupdatebymanager",method = RequestMethod.POST)
	@ResponseBody
	public String updateEmployeeBasicInfo(@RequestParam(name = "empEmail") String empEmail,
			@RequestParam(name = "empAcc", required = false) String empAcc,
			@RequestParam(name = "empName", required = false) String empName,
			@RequestParam(name = "empBday", required = false) String empBday,
			@RequestParam(name = "empAddress", required = false) String empAddress,
			@RequestParam(name = "county", required = false) String county,
			@RequestParam(name = "district", required = false) String district,
			@RequestParam(name = "zipcode", required = false) String zipcode,
			@RequestParam(name = "empAuth", required = false) Integer empAuth,
			@RequestParam(name = "empDeptNum", required = false) Integer empDeptNum) {
		try {
			System.out.println("name:" + empName);
			Employee employee = empService.findByEmpEmail(empEmail);
			employee.setEmpName(empName);
			employee.setEmpBday(empBday);
			employee.setEmpAddress(empAddress);
			employee.setEmpCounty(county);
			employee.setEmpDistrict(district);
			employee.setEmpZipcode(zipcode);
			employee.setEmpAuthority(empAuth);
			employee.setDeptNum(empDeptNum);
			empService.update(employee);
			return "y";
		} catch (Exception e) {
			return "n";
		}
	}
	
	@PostMapping(path = "/empdelete/{email}")
	@ResponseBody
	public String deleteEmployee(@PathVariable("email") String email){
		System.out.println("email"+email);
		empService.deleteById(email);
		usersService.deleteById(email);
		return "yes";
	}
	
	@PostMapping(path = "/emailCheck.controller/{email}" )
	public ResponseEntity<String> processuserCheckAction(@PathVariable("email") String email){
		boolean status = usersService.checkEmail(email);
		if(status) {
			return new ResponseEntity<String>("y", HttpStatus.OK);
		}
			return new ResponseEntity<String>("n", HttpStatus.OK);
	}
	
	
	@GetMapping(path = "/exportmembertocsv")
	public void exportmembertocsv(HttpServletResponse response) throws IOException {
		response.setContentType("text/csv");
		response.setCharacterEncoding("UTF-8");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currenttime = df.format(new Date());
		System.out.println(currenttime);
		String fileName = "members"+currenttime+".csv";
		String headerKey = "Content-Disposition";
		String headerValue = "attachement;filename="+fileName;
		response.setHeader(headerKey, headerValue);
		List<Member> listmember = memeberService.findAll();
		ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(),CsvPreference.STANDARD_PREFERENCE);
		
		String[] csvHeader = {"account","email","name","age","phone","address","county","district","zipcode"};
		String[] nameMapping = {"memberAccount","memberEmail","memberName","memberAge","memberPhone","memberAddress","memberCounty","memberDistrict","memberZipcode"};
		csvWriter.writeHeader(csvHeader);
		for(Member m :listmember) {
			csvWriter.write(m, nameMapping);
		}
		csvWriter.close();
	}

}
