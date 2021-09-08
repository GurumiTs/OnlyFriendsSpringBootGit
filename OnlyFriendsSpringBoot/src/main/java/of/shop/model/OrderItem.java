package of.shop.model;

import java.lang.reflect.Member;
import java.security.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import of.product.model.Product;

@Entity @Table(name = "orderitem")
@Component("orderitem")
public class OrderItem {

	@Id @Column(name = "paymentId")
	private Integer paymentId;
	
	@Column(name = "orderAddress")
	private String orderAddress;
	
	@JoinColumn(name = "memberAccount",referencedColumnName = "memberAccount")
	private String memberAccount;
	
	@Column(name = "total")
	private Integer total;
	
	@Column(name = "orderTime")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp orderTime;// 更新日期
	
	@ManyToMany
	@JoinTable(
			name = "orderproduct",
			joinColumns = @JoinColumn(name="paymentId",referencedColumnName = "paymentId"),
			inverseJoinColumns = @JoinColumn(name="proId",referencedColumnName = "proId")
			)
	private List<Product> orderProducts =new ArrayList<>();

	
	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Timestamp getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}

	public Integer getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(Integer paymentId) {
		this.paymentId = paymentId;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public List<Product> getOrderProducts() {
		return orderProducts;
	}

	public void setOrderProducts(List<Product> orderProducts) {
		this.orderProducts = orderProducts;
	}


	
}
