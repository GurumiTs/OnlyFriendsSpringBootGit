package of.emp.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import of.member.model.MonthTotal;
import of.member.model.Stored;
import of.member.model.StoredService;

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
	private MemberService memberService;
	@Autowired
	private StoredService storedService;

	@GetMapping(path = "/empalltojson")
	@ResponseBody
	public Map allEmployeeToJson(Model m) {
		List<Employee> empList = empService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("data", empList);
		return map;
	}
	
	@GetMapping(path = "/empdeletetojson")
	@ResponseBody
	public Map empDeleteOrNot(Model m) {
		List<Employee> notdelete = empService.empDeleteOrNot(1);
		List<Employee> delete = empService.empDeleteOrNot(0);
		Map<String, Object> map = new HashMap<>();
		map.put("delete",delete);
		map.put("notdelete",notdelete);
		return map;
	}

	@PostMapping(path = "/membersum")
	@ResponseBody
	public Integer memberSum(Model m) {
		List<Member> memberList = memberService.findAll();
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

	@RequestMapping(path = "/empupdatebymanager", method = RequestMethod.POST)
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
	public String deleteEmployee(@PathVariable("email") String email) {
		Employee emp = empService.findByEmpEmail(email);
		if(emp.getEmpdelete() == 0) {
			emp.setEmpdelete(1);		
		}
		else{
			emp.setEmpdelete(0);
		}
		empService.update(emp);
		//empService.deleteById(email);
		//usersService.deleteById(email);
		return "yes";
	}

	@PostMapping(path = "/emailCheck.controller/{email}")
	public ResponseEntity<String> processuserCheckAction(@PathVariable("email") String email) {
		boolean status = usersService.checkEmail(email);
		if (status) {
			return new ResponseEntity<String>("y", HttpStatus.OK);
		}
		return new ResponseEntity<String>("n", HttpStatus.OK);
	}

	@GetMapping(path = "/exportmembertocsv")
	public void exportMemberToCsv(HttpServletResponse response) throws IOException {
		response.setContentType("text/csv");
		response.setCharacterEncoding("UTF-8");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currenttime = df.format(new Date());
		System.out.println(currenttime);
		String fileName = "members" + currenttime + ".csv";
		String headerKey = "Content-Disposition";
		String headerValue = "attachement;filename=" + fileName;
		response.setHeader(headerKey, headerValue);
		List<Member> listmember = memberService.findAll();
		ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);

		String[] csvHeader = { "account", "email", "name", "age", "phone", "address", "county", "district", "zipcode" };
		String[] nameMapping = { "memberAccount", "memberEmail", "memberName", "memberAge", "memberPhone",
				"memberAddress", "memberCounty", "memberDistrict", "memberZipcode" };
		csvWriter.writeHeader(csvHeader);
		for (Member m : listmember) {
			csvWriter.write(m, nameMapping);
		}
		csvWriter.close();
	}

	@GetMapping(path = "/exportstoredtocsv")
	public void exportStoredToCsv(HttpServletResponse response) throws IOException {
		response.setContentType("text/csv");
		response.setCharacterEncoding("UTF-8");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currenttime = df.format(new Date());
		System.out.println(currenttime);
		String fileName = "stored" + currenttime + ".csv";
		String headerKey = "Content-Disposition";
		String headerValue = "attachement;filename=" + fileName;
		response.setHeader(headerKey, headerValue);
		List<Stored> liststored = storedService.findAll();
		ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);

		String[] csvHeader = { "id", "orderId", "account", "orderTime", "total" };
		String[] nameMapping = { "storedId", "orderId", "memberAccount", "orderTime", "total" };
		csvWriter.writeHeader(csvHeader);
		for (Stored s : liststored) {
			csvWriter.write(s, nameMapping);
		}
		csvWriter.close();
	}

	@GetMapping(path = "/exportMonthTotaltocsv")
	public void exportMonthTotalToCsv(HttpServletResponse response) throws IOException {
		response.setContentType("text/csv");
		response.setCharacterEncoding("UTF-8");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currenttime = df.format(new Date());
		System.out.println(currenttime);
		String fileName = "month_total" + currenttime + ".csv";
		String headerKey = "Content-Disposition";
		String headerValue = "attachement;filename=" + fileName;
		response.setHeader(headerKey, headerValue);
		ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);

		List<MonthTotal> total = new ArrayList<>();

		for (int i = 1; i <= 12; i++) {
			Float f = storedService.searchtotal(i);
			if (f == null) {
				f = (float) 0;
			}
			MonthTotal mt = new MonthTotal(i, f);
			total.add(mt);
		}
		String[] csvHeader = { "month","total" };
		String[] nameMapping = { "month", "total"};
		
		csvWriter.writeHeader(csvHeader);
		for (MonthTotal mt : total) {
			csvWriter.write(mt, nameMapping);
		}
		csvWriter.close();
	}

	@PostMapping(path = "/total")
	@ResponseBody
	public List<Float> totalEntry() {
		List<Float> total = new ArrayList<Float>();

		for (int i = 1; i <= 12; i++) {
			Float f = storedService.searchtotal(i);
			if (f == null) {
				f = (float) 0;
			}
			total.add(f);
		}
		return total;

	}
	
	@PostMapping(path = "/memberage")
	@ResponseBody
	public List<Integer> memberAge() {
		
		Integer ma1 = memberService.memberAge("18","25").size();
		Integer ma2 = memberService.memberAge("26","30").size();
		Integer ma3 = memberService.memberAge("31","40").size();
		Integer ma4 = memberService.memberAge("41","50").size();
		List<Integer> memberAge = new ArrayList<>(Arrays. asList(ma1,ma2,ma3,ma4));

		
		return memberAge;

	}

	@PostMapping(path = "/storedannual")
	@ResponseBody
	public Float storedannualEntry() {

		return storedService.storedannual();

	}

	@GetMapping(path = "/monthtotal")
	@ResponseBody
	public List<MonthTotal> monthTotal() {
		List<MonthTotal> total = new ArrayList<>();

		for (int i = 1; i <= 12; i++) {
			Float f = storedService.searchtotal(i);
			if (f == null) {
				f = (float) 0;
			}
			MonthTotal mt = new MonthTotal(i, f);
			total.add(mt);
		}
		return total;
	}

}
