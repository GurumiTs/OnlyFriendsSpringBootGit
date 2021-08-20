//package of.member.model;
//
//import java.io.Serializable;
//import java.util.Set;
//
//import javax.persistence.CascadeType;
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.OneToMany;
//import javax.persistence.Table;
//
//import org.springframework.stereotype.Component;
//
//@Entity @Table(name = "friendship")
//@Component("friendship")
//public class Friendship implements Serializable{
//	
//	@Id @Column(name = "fid")
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Integer fid;	
//	
//	@Column( name = "myAccount")
//	private String myAccount;
//
//	@OneToMany(mappedBy = "memberAccount", cascade = CascadeType.ALL)
//	private Set<Member> friends;
//
//	public Integer getFid() {
//		return fid;
//	}
//
//	public void setFid(Integer fid) {
//		this.fid = fid;
//	}
//
//	public String getMyAccount() {
//		return myAccount;
//	}
//
//	public void setMyAccount(String myAccount) {
//		this.myAccount = myAccount;
//	}
//
//	public Set getFriends() {
//		return friends;
//	}
//
//	public void setFriends(Set friends) {
//		this.friends = friends;
//	}
//
//
//	
//	
//	
//
//	
//
//}
