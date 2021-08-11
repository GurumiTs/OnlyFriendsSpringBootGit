package of.emp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "employee")
@Component("employee")
public class Employee implements Serializable {
	
	@Column(name="empAccount")
	private String empAccount = null;
	
	@Column(name="empPassword")
	private String empPassword = null;
	
	@Column(name="empAuthority")
	private int empAuthority;
	
	@Column(name="empEmailCheck")
	private int empEmailCheck;
	
	@Column(name="empEmailCheckNum")
	private String empEmailCheckNum;
	
	@Column(name="empLoginTime")
	private long empLoginTime;
	
	@Column(name="empLogoutTime")
	private long empLogoutTime;
	
	@Column(name="empCreateTime")
	private long empCreateTime;
	
	@Id@Column(name="empEmail")
	private String empEmail;
	
	@Column(name="empName")
	private String empName;
	
	@Column(name="empCounty")
	private String empCounty;
	
	@Column(name="empDistrict")
	private String empDistrict;
	
	@Column(name="empZipcode")
	private String empZipcode;
	
	@Column(name="empAddress")
	private String empAddress;
	
	@Column(name="empBday")
	private String empBday;
	
	@Column(name="empPic")
	private String empPic;
	
	@Column(name="deptNum")
	private int deptNum;
	
	public Employee() {
		
	}
	
	public Employee(String empEmail,String empAccount,String empName,String empPassword,String empBday,String empPic,String empAddress,String empCounty,
			String empDistrict,String empZipcode,int empAuthority,int deptNum,long empCreateTime  ) {
		this.empEmail = empEmail;
		this.empAccount  = empAccount;
		this.empName = empName;
		this.empPassword = empPassword;
		this.empBday  = empBday;
		this.empPic = empPic;
		this.empAddress = empAddress;
		this.empCounty = empCounty;
		this.empDistrict  = empDistrict;
		this.empZipcode = empZipcode;
		this.empAuthority = empAuthority;
		this.deptNum = deptNum;
		this.empCreateTime = empCreateTime;
		
	}
	
	public String getEmpAccount() {
		return empAccount;
	}
	public void setEmpAccount(String empAccount) {
		this.empAccount = empAccount;
	}
	public String getEmpPassword() {
		return empPassword;
	}
	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}
	public int getEmpAuthority() {
		return empAuthority;
	}
	public void setEmpAuthority(int empAuthority) {
		this.empAuthority = empAuthority;
	}
	public int getEmpEmailCheck() {
		return empEmailCheck;
	}
	public void setEmpEmailCheck(int empEmailCheck) {
		this.empEmailCheck = empEmailCheck;
	}
	public String getEmpEmailCheckNum() {
		return empEmailCheckNum;
	}
	public void setEmpEmailCheckNum(String empEmailCheckNum) {
		this.empEmailCheckNum = empEmailCheckNum;
	}
	public long getEmpLoginTime() {
		return empLoginTime;
	}
	public void setEmpLoginTime(long empLoginTime) {
		this.empLoginTime = empLoginTime;
	}
	public long getEmpLogoutTime() {
		return empLogoutTime;
	}
	public void setEmpLogoutTime(long empLogoutTime) {
		this.empLogoutTime = empLogoutTime;
	}
	public long getEmpCreateTime() {
		return empCreateTime;
	}
	public void setEmpCreateTime(long empCreateTime) {
		this.empCreateTime = empCreateTime;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpCounty() {
		return empCounty;
	}
	public void setEmpCounty(String empCounty) {
		this.empCounty = empCounty;
	}
	public String getEmpDistrict() {
		return empDistrict;
	}
	public void setEmpDistrict(String empDistrict) {
		this.empDistrict = empDistrict;
	}
	public String getEmpZipcode() {
		return empZipcode;
	}
	public void setEmpZipcode(String empZipcode) {
		this.empZipcode = empZipcode;
	}
	public String getEmpAddress() {
		return empAddress;
	}
	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}
	public String getEmpBday() {
		return empBday;
	}
	public void setEmpBday(String empBday) {
		this.empBday = empBday;
	}
	public String getEmpPic() {
		return empPic;
	}
	public void setEmpPic(String empPic) {
		this.empPic = empPic;
	}
	public int getDeptNum() {
		return deptNum;
	}
	public void setDeptNum(int deptNum) {
		this.deptNum = deptNum;
	}
	
	
	
	

}
