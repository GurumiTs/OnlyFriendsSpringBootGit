package of.member.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "member")
@Component("member")
public class Member implements Serializable{
	
	@Id@Column(name="memberAccount")
	private String memberAccount;
	
	@Column(name="memberEmail")
	private String memberEmail;
	
	@Column(name="memberName")
	private String memberName;
	
	@Column(name="memberPic")
	private String memberPic;
	
	@Column(name="memberEmailCheck")
	private int memberEmailCheck;
	
	@Column(name="memberEmailCheckNum")
	private String memberEmailCheckNum;
	
	@Column(name = "memberAuth")
	private int memberAuth;
	
	@Column(name = "memberAge")
	private int memberAge;
	
	@Column(name = "memberPhone")
	private String memberPhone;
	
	@Column(name = "memberAddress")
	private String memberAddress;
	
	@Column(name = "memberCounty")
	private String memberCounty;
	
	@Column(name = "memberDistrict")
	private String memberDistrict;
	
	@Column(name = "memberZipcode")
	private String memberZipcode;
	
	@Column(name = "tagOne")
	private String tagOne;
	
	@Column(name = "tagTwo")
	private String tagTwo;
	
	@Column(name = "tagThree")
	private String tagThree;
	
	@Column(name = "personalInfo")
	private String personalInfo;
	
	@Column(name = "swipeDate")
	private String swipeDate;
	
	@Column(name = "swipeTime")
	private String swipeTime;
	
	@OneToMany
	@JoinColumn(name = "memberAccount")
	private Set<Member> friends;
	
	public Member() {}
	
	public Member(String memberEmail,String memberName,String memberPic) {
		this.memberEmail = memberEmail;
		this.memberName = memberName;
		this.memberPic = memberPic;
	}
	

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPic() {
		return memberPic;
	}

	public void setMemberPic(String memberPic) {
		this.memberPic = memberPic;
	}

	public int getMemberEmailCheck() {
		return memberEmailCheck;
	}

	public void setMemberEmailCheck(int memberEmailCheck) {
		this.memberEmailCheck = memberEmailCheck;
	}

	public String getMemberEmailCheckNum() {
		return memberEmailCheckNum;
	}

	public void setMemberEmailCheckNum(String memberEmailCheckNum) {
		this.memberEmailCheckNum = memberEmailCheckNum;
	}

	public int getMemberAuth() {
		return memberAuth;
	}

	public void setMemberAuth(int memberAuth) {
		this.memberAuth = memberAuth;
	}

	public int getMemberAge() {
		return memberAge;
	}

	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberCounty() {
		return memberCounty;
	}

	public void setMemberCounty(String memberCounty) {
		this.memberCounty = memberCounty;
	}

	public String getMemberDistrict() {
		return memberDistrict;
	}

	public void setMemberDistrict(String memberDistrict) {
		this.memberDistrict = memberDistrict;
	}

	public String getMemberZipcode() {
		return memberZipcode;
	}

	public void setMemberZipcode(String memberZipcode) {
		this.memberZipcode = memberZipcode;
	}

	public String getTagOne() {
		return tagOne;
	}

	public void setTagOne(String tagOne) {
		this.tagOne = tagOne;
	}

	public String getTagTwo() {
		return tagTwo;
	}

	public void setTagTwo(String tagTwo) {
		this.tagTwo = tagTwo;
	}

	public String getTagThree() {
		return tagThree;
	}

	public void setTagThree(String tagThree) {
		this.tagThree = tagThree;
	}

	public String getPersonalInfo() {
		return personalInfo;
	}

	public void setPersonalInfo(String personalInfo) {
		this.personalInfo = personalInfo;
	}

	public String getSwipeDate() {
		return swipeDate;
	}

	public void setSwipeDate(String swipeDate) {
		this.swipeDate = swipeDate;
	}

	public String getSwipeTime() {
		return swipeTime;
	}

	public void setSwipeTime(String swipeTime) {
		this.swipeTime = swipeTime;
	}



	
	

}
