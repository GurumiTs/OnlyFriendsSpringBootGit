package of.coupon.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity @Table(name = "CouponUsers")
@Component("couponUsers")
public class CouponUsers {
	@Id
	private String memberAccount;	
	private String couponRecord;
	
	public String getMemberAccount() {
		return memberAccount;
	}
	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}
	public String getCouponRecord() {
		return couponRecord;
	}
	public void setCouponRecord(String couponRecord) {
		this.couponRecord = couponRecord;
	}

	
}
