package of.party.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "party")
@Component("party")
public class Party implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "number")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int number;
	@Column(name = "cover")
	private String cover;
	@Column(name = "name")
	private String name;
	@Column(name = "type")
	private String type;
	@Column(name = "time")
	private String time;
	@Column(name = "time_up")
	private String time_up;// 要留嗎???
	@Column(name = "plany")
	private String plany;

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
	@Column(name = "see")
	private int see;

	public Party() {
	}

	public Party(int number, String cover, String name, String type, String time, String time_up, String county,
			String district, String zipcode, String plany, String place, String condition, int man, int woman,
			int see) {
		super();
		this.number = number;
		this.cover = cover;
		this.name = name;
		this.type = type;
		this.time = time;
		this.time_up = time_up;
		this.county = county;
		this.district = district;
		this.zipcode = zipcode;
		this.plany = plany;
		this.place = place;
		this.condition = condition;
		this.man = man;
		this.woman = woman;
		this.see = see;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTime_up() {
		return time_up;
	}

	public void setTime_up(String time_up) {
		this.time_up = time_up;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	public String getPlany() {
		return plany;
	}

	public void setPlany(String plany) {
		this.plany = plany;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public int getMan() {
		return man;
	}

	public void setMan(int man) {
		this.man = man;
	}

	public int getWoman() {
		return woman;
	}

	public void setWoman(int woman) {
		this.woman = woman;
	}

	public int getSee() {
		return see;
	}

	public void setSee(int see) {
		this.see = see;
	}

}

