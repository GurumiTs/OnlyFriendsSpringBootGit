package of.shop.model;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import of.member.model.Member;
import of.product.model.Product;


public class CartItem {
	
	private Integer amount;
	private Product product;
	private Integer total;
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}

	
	

//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Integer cartId;
//	
//	@OneToMany
//	@JoinColumn(name = "cartId")
//	private List<Product> items = new ArrayList<>();
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

//	public Integer getCartId() {
//		return cartId;
//	}
//
//	public void setCartId(Integer cartId) {
//		this.cartId = cartId;
//	}
//
//	public List<Product> getItems() {
//		return items;
//	}
//
//	public void setItems(List<Product> items) {
//		this.items = items;
//	}
	
	

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
