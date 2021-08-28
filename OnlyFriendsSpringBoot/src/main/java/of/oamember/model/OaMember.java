package of.oamember.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="OaMember")
@Component("OaMember")
public class OaMember {
	@Id
	@Column(name= "anum") //活動編號
	private long anum ;
	@Column(name="Img") //圖片
	private String img;
	@Column(name="Active")//活動名稱
	private String active;
	@Column(name="Atype")//活動類型
	private String atype;
	@Column(name="Atype2")//活動類型2
	private String atype2;
	@Column(name="County")//活動縣市
	private String county;
	@Column(name="District")//活動行政區
	private String district;
	@Column(name="memberAccount")//會員ID
	private String memberAccount;
	@Column(name="Date")//日期
	private String date;

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getAtype() {
		return atype;
	}

	public void setAtype(String atype) {
		this.atype = atype;
	}

	public String getAtype2() {
		return atype2;
	}

	public void setAtype2(String atype2) {
		this.atype2 = atype2;
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

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
