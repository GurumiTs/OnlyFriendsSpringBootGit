package of.Advertisement.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "advertisement")
@Component("advertisement")
public class Advertisement {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer adId;
	private String adCompanyName;
	private String adCompanyPhone;
	private String adCompanyEmail;
	private String adName;
	private String adStartDate;
	private String adEndDate;
	private String adCondition;
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
