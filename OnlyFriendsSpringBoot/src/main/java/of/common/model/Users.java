package of.common.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import of.member.model.Member;

@Entity @Table(name = "users")
@Component("users")
public class Users implements Serializable{
	
	@Id@Column(name="usersEmail",length = 50)
	private String usersEmail;
	
	@Column(name="usersPassword",length = 100)
	private String usersPassword;
	
	@Column(name="usersRole")
	private String usersRole;
		
	@ManyToMany
	@JoinTable(
			name = "friendship",
			joinColumns = @JoinColumn(name = "usersEmail", referencedColumnName = "usersEmail"), 
			inverseJoinColumns = @JoinColumn(name = "memberAccount",referencedColumnName = "memberAccount")					
			)	
	private List<Member> friends = new ArrayList<>();
	
	public Users() {
		
	}
	public Users(String usersEmail,String usersPassword,String usersRole) {
		this.usersEmail = usersEmail;
		this.usersPassword = usersPassword;
		this.usersRole = usersRole;
	}
	public Users(String usersEmail,String usersRole) {
		this.usersEmail = usersEmail;
		this.usersRole = usersRole;
	}

	public String getUsersEmail() {
		return usersEmail;
	}

	public void setUsersEmail(String usersEmail) {
		this.usersEmail = usersEmail;
	}

	public String getUsersPassword() {
		return usersPassword;
	}

	public void setUsersPassword(String usersPassword) {
		this.usersPassword = usersPassword;
	}

	public String getUsersRole() {
		return usersRole;
	}

	public void setUsersRole(String usersRole) {
		this.usersRole = usersRole;
	}

	
	
	public List<Member> getFriends() {
		return friends;
	}

	public void setFriends(List<Member> friends) {
		this.friends = friends;
	}

	public void addFriend(Member member) {
		this.friends.add(member);
	}
	
	public void remove(Member member) {
		this.friends.remove(member);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((usersEmail == null) ? 0 : usersEmail.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Users other = (Users) obj;
		if (usersEmail == null) {
			if (other.usersEmail != null)
				return false;
		} else if (!usersEmail.equals(other.usersEmail))
			return false;
		return true;
	}
	
	

	
	
	
	
	

}
