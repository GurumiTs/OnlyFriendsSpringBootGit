package of.officialactive.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;



@Entity
@Table(name="MemberActive")
@Component("MemberActive")
public class MemberActive implements Serializable{
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long anum;
	@Column
	private String memberAccount;
	
	public long getAnum() {
		return anum;
	}

	public void setAnum(long anum) {
		this.anum = anum;
	}

	public String getmemberAccount() {
		return memberAccount;
	}

	public void setmemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

//	public MemberActive() {
//		
//	}
//
//	public MemberActive(long anum,String memberAccount) {
//		this.anum = anum;
//		this.memberAccount = memberAccount;
//	}
}
