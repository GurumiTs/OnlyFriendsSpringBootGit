package of.officialactive.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class OfficialActiveFindOa {
	@Column (name = "EmpAcc")
	private String empAcc; // 員工編號
	@Id
	@Column(name="Anum")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long anum; // 活動編號 PK(1,1)  
	@Column(name="Aname")
	private String aname;//管理者名稱
	@Column(name="Atype")
	private String atype;//活動類型1
	@Column(name="Atype2")
	private String atype2;//活動類型2
	@Column(name="Adate")
	private String adate;//活動日期
	@Column(name="StartDeadline")
	private String startDeadline;//活動報名期限
	@Column(name="FinishDeadline")
	private String finishDeadline;//活動報名期限	
	@Column(name="Active")
	private String active;//活動名稱
	@Column(name="County")
	private String county;//活動縣市
	@Column(name="District")
	private String district;//活動行政區
	@Column(name="Conditions")
	private String conditions;//活動內容
	@Column(name="Male")
	private String male;//男性
	@Column(name="Female")
	private String female;//女性
	@Column(name="Img")
	private String img;//圖片
	
	
	
	public long getAnum() {
		return anum;
	}
	public void setAnum(long anum) {
		this.anum = anum;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAtype() {
		return atype;
	}
	public void setAtype(String atype) {
		this.atype = atype;
	}
	public String getAtype2() {
		return atype2;
	}
	public void setAtype2(String atype2) {
		this.atype2 = atype2;
	}
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
	public String getStartDeadline() {
		return startDeadline;
	}
	public void setStartDeadline(String startDeadline) {
		this.startDeadline = startDeadline;
	}
	public String getFinishDeadline() {
		return finishDeadline;
	}
	public void setFinishDeadline(String finishDeadline) {
		this.finishDeadline = finishDeadline;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
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
	public String getConditions() {
		return conditions;
	}
	public void setConditions(String conditions) {
		this.conditions = conditions;
	}
	public String getMale() {
		return male;
	}
	public void setMale(String male) {
		this.male = male;
	}
	public String getFemale() {
		return female;
	}
	public void setFemale(String female) {
		this.female = female;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
