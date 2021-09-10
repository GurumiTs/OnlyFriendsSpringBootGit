package of.shop.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "orderitem")
@Component("orderitem")
@IdClass(OrderItem.class)
public class OrderItem implements Serializable{
	@Id@Column(name = "paymentId")
	private String paymentId;
	@Id@Column(name = "proId")
	private int proId;
	@Column(name = "amount")
	private int amount;
	
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Integer getProductId() {
		return proId;
	}
	public void setProductId(Integer productId) {
		this.proId = productId;
	}
	
	
}
