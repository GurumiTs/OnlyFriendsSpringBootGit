package of.common.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "users")
@Component("users")
public class Users implements Serializable{
	
	@Id@Column(name="usersEmail")
	private String usersEmail;
	
	@Column(name="usersPassword")
	private String usersPassword;
	
	@Column(name="usersRole")
	private String usersRole;
	
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
	
	

}
