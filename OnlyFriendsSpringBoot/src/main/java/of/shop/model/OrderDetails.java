package of.shop.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import of.product.model.Product;

@Entity @Table(name = "orderdetails")
@Component("orderdetails")
public class OrderDetails {

	@Id @Column(name = "paymentId")
	private String paymentId;
	
	@Column(name = "orderAddress")
	private String orderAddress;
	
	@JoinColumn(name = "memberAccount",referencedColumnName = "memberAccount")
	private String memberAccount;
	
	@Column(name = "total")
	private Float total;
	
	@Column(name = "orderTime")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp orderTime;// 更新日期
	
	@Column(name = "orderId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderId;
	
	@Column(name = "orderStatus")
	private String orderStatus;
	
	@Column(name = "orderDiscount")
	private String orderDiscount;
	
	@ManyToMany
	@JoinTable(
			name = "orderitem",
			joinColumns = @JoinColumn(name="paymentId",referencedColumnName = "paymentId"),
			inverseJoinColumns = @JoinColumn(name="proId",referencedColumnName = "proId")
			)
	private List<Product> orderitem =new ArrayList<>();
	
	
	
	public OrderDetails() {
		
	}

	public OrderDetails(String paymentId, String orderAddress, String memberAccount, Float total, Timestamp orderTime,
			List<Product> orderitem) {
		this.paymentId = paymentId;
		this.orderAddress = orderAddress;
		this.memberAccount = memberAccount;
		this.total = total;
		this.orderTime = orderTime;
		this.orderitem = orderitem;
	}

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public Float getTotal() {
		return total;
	}

	public void setTotal(Float total) {
		this.total = total;
	}

	public Timestamp getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public List<Product> getOrderItem() {
		return orderitem;
	}

	public void setOrderItem(List<Product> orderitem) {
		this.orderitem = orderitem;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderDiscount() {
		return orderDiscount;
	}

	public void setOrderDiscount(String orderDiscount) {
		this.orderDiscount = orderDiscount;
	}


	
	
	
}
