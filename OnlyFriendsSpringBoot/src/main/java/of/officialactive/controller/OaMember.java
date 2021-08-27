package of.officialactive.controller;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="OaMember")
@Component("OaMember")
public class OaMember {
	
	private String img;
	
	private String active;
	
	private String atype;
	
	private String atype2;
	
	private String county;
	
	private String district;
	
	private String memberAccount;
	
	//private 
}
