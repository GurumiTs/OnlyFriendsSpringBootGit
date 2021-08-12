package of.member.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "member")
@Component("member")
public class Member implements Serializable{
	
	@Id@Column(name="memberEmail")
	private String memberEmail;
	
	@Column(name="memberName")
	private String memberName;
	
	@Column(name="memberPic")
	private String memberPic;
	
	@Column(name="memberEmailCheck")
	private int memberEmailCheck;
	
	@Column(name="memberEmailCheckNum")
	private String memberEmailCheckNum;
	
	public Member() {}
	
	public Member(String memberEmail,String memberName,String memberPic) {
		this.memberEmail = memberEmail;
		this.memberName = memberName;
		this.memberPic = memberPic;
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
	
	

}
