package of.product.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name = "Product")
@Component("Product")
public class Product implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private Integer proId;
	
	@Column(name = "Photo",nullable = false)
	private String proPhoto;
	
	@Column(name = "Name",unique = true, nullable = false)
	private String proName;
	
	@Column(name="Description")
	private String proDescription;
	
	@Column(name = "Price", nullable = false)
	private Integer proPrice;
	
	@Column(name = "Item")
	private String proItem;
	
	@Column(name = "Num", nullable = false)
	private Integer proNum;
	
	@Column(name = "Shipping", nullable = false)
	private Integer proShipping;
	
	public Product() {
		
	}

	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}

	public String getProPhoto() {
		return proPhoto;
	}

	public void setProPhoto(String proPhoto) {
		this.proPhoto = proPhoto;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProDescription() {
		return proDescription;
	}

	public void setProDescription(String proDescription) {
		this.proDescription = proDescription;
	}

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public String getProItem() {
		return proItem;
	}

	public void setProItem(String proItem) {
		this.proItem = proItem;
	}

	public int getProNum() {
		return proNum;
	}

	public void setProNum(int proNum) {
		this.proNum = proNum;
	}

	public int getProShipping() {
		return proShipping;
	}

	public void setProShipping(int proShipping) {
		this.proShipping = proShipping;
	}
	
	
	

}
