package of.UserActivity.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "UserActivity")
@Component("UserActivity")
public class UserActivity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "number")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int number;

//	@OneToOne
	@JoinColumn(name = "memberAccount")
	private String memberAccount;

	@Column(name = "approve")
	private String approve;

	@Column(name = "Activityname")
	private String activityname;

	@Column(name = "cover")
	private String cover;

	@Column(name = "type")
	private String type;
	@Column(name = "time")
	private String time;
	@Column(name = "time_up")
	private String time_up;
	@Column(name = "detail")
	private String detail;

	@Column(name = "county")
	private String county;
	@Column(name = "district")
	private String district;
	@Column(name = "zipcode")
	private String zipcode;
	@Column(name = "place")
	private String place;

	@Column(name = "condition")
	private String condition;
	@Column(name = "man")
	private int man;
	@Column(name = "woman")
	private int woman;
	@Column(name = "total")
	private int total;
	@Column(name = "see")
	private int see;
	
	public UserActivity() {	}
	
	public UserActivity(int number, String memberAccount, String approve, String activityname, String cover,
			String type, String time, String time_up, String detail, String county, String district, String zipcode,
			String place, String condition, int man, int woman, int total, int see) {
		this.number = number;
		this.memberAccount = memberAccount;
		this.approve = approve;
		this.activityname = activityname;
		this.cover = cover;
		this.type = type;
		this.time = time;
		this.time_up = time_up;
		this.detail = detail;
		this.county = county;
		this.district = district;
		this.zipcode = zipcode;
		this.place = place;
		this.condition = condition;
		this.man = man;
		this.woman = woman;
		this.total = total;
		this.see = see;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getMemberAccount() {
		return memberAccount;
	}
	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}
	public String getApprove() {
		return approve;
	}
	public void setApprove(String b) {
		this.approve = b;
	}
	public String getActivityname() {
		return activityname;
	}
	public void setActivityname(String activityname) {
		this.activityname = activityname;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTime_up() {
		return time_up;
	}
	public void setTime_up(String time_up) {
		this.time_up = time_up;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public int getMan() {
		return man;
	}
	public void setMan(int man) {
		this.man = man;
	}
	public int getWoman() {
		return woman;
	}
	public void setWoman(int woman) {
		this.woman = woman;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getSee() {
		return see;
	}
	public void setSee(int see) {
		this.see = see;
	}
	
}