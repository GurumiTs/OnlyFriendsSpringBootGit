package of.member.model;

import javax.persistence.Entity;

public class MemberChatnum {
	
	private String friendAccount;
	private String friendName;
	private String friendPic;
	private Integer chatnum;
	public String getFriendAccount() {
		return friendAccount;
	}
	public void setFriendAccount(String friendAccount) {
		this.friendAccount = friendAccount;
	}
	public String getFriendName() {
		return friendName;
	}
	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}
	public String getFriendPic() {
		return friendPic;
	}
	public void setFriendPic(String friendPic) {
		this.friendPic = friendPic;
	}
	public Integer getChatnum() {
		return chatnum;
	}
	public void setChatnum(Integer chatnum) {
		this.chatnum = chatnum;
	}
	
	

}
