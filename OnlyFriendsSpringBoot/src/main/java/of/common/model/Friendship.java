package of.common.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "friendship")
@Component("friendship")
@IdClass(Friendship.class)
public class Friendship implements Serializable{
	
	@Id@Column(name = "usersEmail")
	private String usersEmail;
	@Id@Column(name = "memberAccount")		
	private String memberAccount;
	@Column(name = "chatnum")
	private Integer chatnum;
	
	
	public String getUsersEmail() {
		return usersEmail;
	}
	public void setUsersEmail(String usersEmail) {
		this.usersEmail = usersEmail;
	}
	public String getMemberAccount() {
		return memberAccount;
	}
	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}
	public Integer getChatnum() {
		return chatnum;
	}
	public void setChatnum(Integer chatnum) {
		this.chatnum = chatnum;
	}
	
	
	

}
