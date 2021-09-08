package of.shop.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "orderproduct")
@Component("orderproduct")
@IdClass(OrderProduct.class)
public class OrderProduct implements Serializable{
	@Id@Column(name = "paymentId")
	private int paymentId;
	@Id@Column(name = "proId")
	private int proId;
	@Column(name = "amount")
	private int amount;
	
	public Integer getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(Integer paymentId) {
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
