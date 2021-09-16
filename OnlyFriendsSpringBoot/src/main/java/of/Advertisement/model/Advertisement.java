package of.Advertisement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "Advertisement")
@Component("advertisement")
public class Advertisement {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "adId")
	private Integer adId;
	@Column(name = "adCompanyName")
	private String adCompanyName;
	@Column(name = "adCompanyPhone")
	private String adCompanyPhone;	
	@Column(name = "adCompanyEmail")
	private String adCompanyEmail;
	@Column(name = "adName")
	private String adName;
	@Column(name = "adStartDate")
	private String adStartDate;
	@Column(name = "adEndDate")
	private String adEndDate;
	@Column(name = "adCondition")
	private String adCondition;
	@Column(name = "adImg")
	private String adImg;
	public Integer getAdId() {
		return adId;
	}
	public void setAdId(Integer adId) {
		this.adId = adId;
	}
	public String getAdCompanyName() {
		return adCompanyName;
	}
	public void setAdCompanyName(String adCompanyName) {
		this.adCompanyName = adCompanyName;
	}
	public String getAdCompanyPhone() {
		return adCompanyPhone;
	}
	public void setAdCompanyPhone(String adCompanyPhone) {
		this.adCompanyPhone = adCompanyPhone;
	}
	public String getAdCompanyEmail() {
		return adCompanyEmail;
	}
	public void setAdCompanyEmail(String adCompanyEmail) {
		this.adCompanyEmail = adCompanyEmail;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public String getAdStartDate() {
		return adStartDate;
	}
	public void setAdStartDate(String adStartDate) {
		this.adStartDate = adStartDate;
	}
	public String getAdEndDate() {
		return adEndDate;
	}
	public void setAdEndDate(String adEndDate) {
		this.adEndDate = adEndDate;
	}
	public String getAdCondition() {
		return adCondition;
	}
	public void setAdCondition(String adCondition) {
		this.adCondition = adCondition;
	}
	public String getAdImg() {
		return adImg;
	}
	public void setAdImg(String adImg) {
		this.adImg = adImg;
	}
	
	
	
	
	
}
