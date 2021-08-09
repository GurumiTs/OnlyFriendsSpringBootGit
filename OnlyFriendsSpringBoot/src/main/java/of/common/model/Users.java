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
	
	@Id@Column(name="email")
	private String email;
	@Column(name="usertype")
	private int userType;
	
	public Users() {
		
	}
	
	public Users(String email,int userType) {
		this.email = email;
		this.userType = userType;
	}

	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getUsertype() {
		return userType;
	}
	public void setUsertype(int userType) {
		this.userType = userType;
	}
	

}
