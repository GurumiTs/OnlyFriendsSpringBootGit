package of.UserActivity.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "UserActivity")
public class UserActivity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "number")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int number;

//	@OneToMany
	@JoinColumn(name = "memberAccount")
	private String memberAccount;

	@Column(name = "approve")
	private boolean approve;

	@Column(name = "Activityname")
	private String Activityname;

	@Column(name = "cover")
	private String cover;

	@Column(name = "type")
	private String type;
	@Column(name = "time")
	private String time;
	@Column(name = "time_up")
	private String time_up;
	@Column(name = "detail")
	private String detail;

	@Column(name = "county")
	private String county;
	@Column(name = "district")
	private String district;
	@Column(name = "zipcode")
	private String zipcode;
	@Column(name = "place")
	private String place;

	@Column(name = "condition")
	private String condition;
	@Column(name = "man")
	private int man;
	@Column(name = "woman")
	private int woman;
	@Column(name = "total")
	private int total;
	@Column(name = "see")
	private int see;
}