package of.member.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity @Table(name = "stored")
@Component("stored")
public class Stored implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "storedId")
	private Integer storedId;
	
	@Column(name = "orderId")
	private String orderId;
	
	@JoinColumn(name = "memberAccount", referencedColumnName = "memberAccount")
	private String memberAccount;
	
	@Column(name = "orderTime")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp orderTime;
	
	@Column(name = "total")
	private Float total;
	
	public Stored() {}
	
	public Stored(String orderId, String memberAccount, Timestamp orderTime, Float total) {
		this.orderId = orderId;
		this.memberAccount = memberAccount;
		this.orderTime = orderTime;
		this.total = total;
	}

	public Integer getStoredId() {
		return storedId;
	}

	public void setStoredId(Integer storedId) {
		this.storedId = storedId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public Timestamp getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}

	public Float getTotal() {
		return total;
	}

	public void setTotal(Float total) {
		this.total = total;
	}
	
	

}
