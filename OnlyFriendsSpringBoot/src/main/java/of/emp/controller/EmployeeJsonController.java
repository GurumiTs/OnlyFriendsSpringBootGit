package of.emp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import of.common.model.Users;
import of.common.model.UsersService;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;

@Controller
@RequestMapping(path = "/employee")
public class EmployeeJsonController {
	@Autowired
	private EmployeeService empService;
	@Autowired
	private Employee employee;
	@Autowired
	private UsersService usersService;
	@Autowired
	private Users users;

	@GetMapping(path = "/allEmployeeToJson")
	@ResponseBody
	public Map allEmployeeToJson(Model m) {
		List<Employee> empList = empService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("data", empList);
		return map;
	}

	@PostMapping(path = "/queryEmployee")
	@ResponseBody
	public Employee processRestQueryEmployee(@RequestParam(name = "email") String email) {
		Employee employee = empService.findByEmpEmail(email);
		return employee;
	}

	@RequestMapping(path = "/updateEmployeeBasicInfo",method = RequestMethod.POST)
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
	
	@PostMapping(path = "/deleteemployee/{email}")
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

}
