package of.shop.model;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

import of.member.model.Member;
import of.product.model.Product;

@Entity
@Table(name = "CartItem")
public class CartItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cartId;
	
	
	private List<Map> items = new ArrayList<Map>();
//	@ManyToOne
//	@JoinColumn(name = "proId")
//	private Product proId;
//	
//	@ManyToOne
//	@JoinColumn(name="memberAccount")
//	private Member memberAccount;
	
//	@Column(name="amount")
//	private Integer amount;
//	
//	@Column(name = "orderdate")
//	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
//	private Timestamp orderdate;

	public Integer getCartId() {
		return cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}

	public List<Map> getItems() {
		return items;
	}

	public void setItems(List<Map> items) {
		this.items = items;
	}
	
	

//	public Product getProId() {
//		return proId;
//	}
//
//	public void setProId(Product proId) {
//		this.proId = proId;
//	}

//	public Member getMemberAccount() {
//		return memberAccount;
//	}
//
//	public void setMemberAccount(Member memberAccount) {
//		this.memberAccount = memberAccount;
//	}

//	public Integer getAmount() {
//		return amount;
//	}
//
//	public void setAmount(Integer amount) {
//		this.amount = amount;
//	}
//
//	public Timestamp getOrderdate() {
//		return orderdate;
//	}
//
//	public void setOrderdate(Timestamp orderdate) {
//		this.orderdate = orderdate;
//	}
//	
	
}
