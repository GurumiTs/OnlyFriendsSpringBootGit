//package of.UserActivity.model;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.persistence.JoinColumn;
//import javax.persistence.JoinTable;
//import javax.persistence.ManyToMany;
//
//import of.member.model.Member;
//
//public class participate {
//
//	@JoinColumn(name = "memberAccount", referencedColumnName = "memberAccount")
//	private String memberAccount;
//
//	@JoinColumn(name = "number", referencedColumnName = "number")
//	private String number;
//
//	@ManyToMany
//	@JoinTable(name = "participate", 
//	joinColumns = @JoinColumn(name = "number"),
//	inverseJoinColumns = @JoinColumn(name = "memberAccount"))
//	private List<UserActivity> participate = new ArrayList<UserActivity>();
//
//	public participate() {
//	}
//
//	public participate(String memberAccount, String number, List<UserActivity> participate) {
//		this.memberAccount = memberAccount;
//		this.number = number;
//		this.participate = participate;
//	}
//
//	public String getMemberAccount() {
//		return memberAccount;
//	}
//
//	public void setMemberAccount(String memberAccount) {
//		this.memberAccount = memberAccount;
//	}
//
//	public String getNumber() {
//		return number;
//	}
//
//	public void setNumber(String number) {
//		this.number = number;
//	}
//
//	public List<UserActivity> getParticipate() {
//		return participate;
//	}
//
//	public void setParticipate(List<UserActivity> participate) {
//		this.participate = participate;
//	}
//
//	public void addUserActivity(UserActivity userActivity) {
//		this.participate.add(userActivity);
//	}
//
//	public void removeUserActivity(UserActivity userActivity) {
//		this.participate.remove(userActivity);
//	}
//
//}
