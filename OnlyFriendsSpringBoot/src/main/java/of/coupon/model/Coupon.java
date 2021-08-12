package of.coupon.model;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "Coupon")
@Component("coupon")
public class Coupon {
	@Id
	private String pName;
	private String coName;
	private String pImg;
	private String price;
	private String pQty;
	private String startDate;
	private String endDate;
	private String caName;

	public Coupon() {
	
	}

	public Coupon(String pName, String coName, String pImg, String price, String pQty, String startDate, String endDate,
			String caName) {
		super();
		this.pName = pName;
		this.coName = coName;
		this.pImg = pImg;
		this.price = price;
		this.pQty = pQty;
		this.startDate = startDate;
		this.endDate = endDate;
		this.caName = caName;
	}


	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getCoName() {
		return coName;
	}

	public void setCoName(String coName) {
		this.coName = coName;
	}

	public String getpImg() {
		return pImg;
	}

	public void setpImg(String pImg) {
		this.pImg = pImg;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getpQty() {
		return pQty;
	}

	public void setpQty(String pQty) {
		this.pQty = pQty;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getCaName() {
		return caName;
	}

	public void setCaName(String caName) {
		this.caName = caName;
	}
	
	

}

