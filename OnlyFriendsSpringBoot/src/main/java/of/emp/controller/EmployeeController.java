package of.emp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import of.common.model.Users;
import of.common.model.UsersService;
import of.common.util.BCrypt;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;

@Controller
@SessionAttributes(names = { "user", "successMsg", "errorMsg", "empList" })
public class EmployeeController {
	@Autowired
	private EmployeeService empService;
	@Autowired
	private Employee employee;
	@Autowired
	private UsersService usersService;
	@Autowired
	private Users users;
	

	@RequestMapping(path = "/employee",method = RequestMethod.GET)
	public String signupempEntry() {
		return "employeepages/employee";
	}
	
	@RequestMapping(path = "/employeeprofile.controller", method = RequestMethod.GET)
	public String employeeProfile(HttpSession session, Model model) {
		Employee employee = (Employee) session.getAttribute("user");
		String email = employee.getEmpEmail();
		Employee newEmp = empService.selectEmployee(email);
		empService.saveOrUpdate(newEmp);
		model.addAttribute("user", employee);
		return "employeepages/empprofile";
	}

	@RequestMapping(path = "/updateempinfo.controller", method = RequestMethod.POST)
	public String updateEmpInfo(@RequestParam(name = "empEmail", required = false) String empEmail,
			@RequestParam(name = "empAcc", required = false) String empAcc,
			@RequestParam(name = "empName", required = false) String empName,
			@RequestParam(name = "empBday", required = false) String empBday,
			@RequestParam(name = "empAddress", required = false) String empAddress,
			@RequestParam(name = "county", required = false) String county,
			@RequestParam(name = "district", required = false) String district,
			@RequestParam(name = "zipcode", required = false) String zipcode, Model model) {
		try {
			Employee employee = empService.selectEmployee(empEmail);
			employee.setEmpName(empName);
			employee.setEmpBday(empBday);
			employee.setEmpAddress(empAddress);
			employee.setEmpCounty(county);
			employee.setEmpDistrict(district);
			employee.setEmpZipcode(zipcode);
			System.out.println("try");
			System.out.println(employee.getEmpName());
			empService.saveOrUpdate(employee);
			model.addAttribute("successMsg", "basic info update success");
			model.addAttribute("user", employee);
			return "employeepages/empprofile";
		} catch (Exception e) {
			model.addAttribute("errorMsg", "basic info update failed");
			model.addAttribute("user", employee);
			return "employeepages/empprofile";
		}

	}

	@RequestMapping(path = "/updateemppwd.controller", method = RequestMethod.POST)
	public String updateEmployeePassword(@RequestParam(name = "empEmail", required = false) String empEmail,
			@RequestParam(name = "oldPwd", required = false) String oldPassword,
			@RequestParam(name = "updatePwd1", required = false) String newPassword, HttpServletRequest request,
			Model model) {

		try {
			Employee employee = empService.selectEmployee(empEmail);
			String oldHashPassword = employee.getEmpPassword();
			boolean checkPasswordStatus = BCrypt.checkpw(oldPassword, oldHashPassword);
			if(checkPasswordStatus == true) {
				String newHashPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
				employee.setEmpPassword(newHashPassword);
				empService.saveOrUpdate(employee);
				model.addAttribute("successMsg", "update password success");
				model.addAttribute("user", employee);
				return "employeepages/empprofile";
			}
			model.addAttribute("errorMsg", "update password failed");
			return "employeepages/empprofile";
			
		} catch (Exception e) {
			model.addAttribute("errorMsg", "update password failed");
			return "employeepages/empprofile";
		}

	}

	@RequestMapping(path = "/updateemppic.controller", method = RequestMethod.POST)
	public String updateEmployeePic(@RequestParam(name = "empEmail", required = false) String empEmail,
			@RequestParam(name = "empPic", required = false) MultipartFile multipartFile, HttpServletRequest request,
			Model model) {
		try {
			String fileName = multipartFile.getOriginalFilename();
			System.out.println("filename:" + fileName);
			String path1 = request.getServletContext().getRealPath("/images");
			String filePath = path1 + "/empPic/" + fileName;
			File saveFile = new File(filePath);
			multipartFile.transferTo(saveFile);
			Employee employee = empService.selectEmployee(empEmail);
			employee.setEmpPic("images/empPic/" + fileName);
			empService.saveOrUpdate(employee);
			model.addAttribute("successMsg", "basic info update success");
			model.addAttribute("user", employee);
			return "employeepages/empprofile";
		} catch (Exception e) {
			model.addAttribute("errorMsg", "update picture failed");
			return "employeepages/empprofile";
		}

	}

	@RequestMapping(path = "/employeemgmt.controller", method = RequestMethod.GET)
	public String employeeMgmt(Model model) {
		List<Employee> empList = empService.selectAllEmployee();
		model.addAttribute("empList", empList);
		return "employeepages/empmgmt";
	}
	
	@RequestMapping(path = "/myteam.controller", method = RequestMethod.GET)
	public String myTeam(HttpSession session,Model model) {
		Employee employee = (Employee) session.getAttribute("user");
		int deptNum = employee.getDeptNum();
		List<Employee> teamList = empService.selectMyTeam(deptNum);
		model.addAttribute("teamList", teamList);
		return "employeepages/empteam";
	}

	@RequestMapping(path = "/updateempauth.controller", method = RequestMethod.POST)
	public String updateEmployeeAuth(@RequestParam(name = "empEmail", required = false) String empEmail,
			@RequestParam(name = "empAcc", required = false) String empAcc,
			@RequestParam(name = "empName", required = false) String empName,
			@RequestParam(name = "empBday", required = false) String empBday,
			@RequestParam(name = "empAddress", required = false) String empAddress,
			@RequestParam(name = "county", required = false) String county,
			@RequestParam(name = "district", required = false) String district,
			@RequestParam(name = "zipcode", required = false) String zipcode,
			@RequestParam(name = "empAuth", required = false) int empAuth,
			@RequestParam(name = "empDeptNum", required = false) int empDeptNum, Model model) {

		try {
			Employee employee = empService.selectEmployee(empEmail);
			employee.setEmpName(empName);
			employee.setEmpBday(empBday);
			employee.setEmpAddress(empAddress);
			employee.setEmpCounty(county);
			employee.setEmpDistrict(district);
			employee.setEmpZipcode(zipcode);
			employee.setEmpAuthority(empAuth);
			employee.setDeptNum(empDeptNum);
			empService.saveOrUpdate(employee);
			List<Employee> empList = empService.selectAllEmployee();
			model.addAttribute("empList", empList);
			model.addAttribute("successMsg", "basic info update success");
			return "employeepages/empmgmt";
		} catch (Exception e) {
			model.addAttribute("errorMsg", "update employee failed");
			return "employeepages/empmgmt";
		}

	}
	
	

}
