package of.officialactive.model;

import java.io.Serializable;

public class OfficialActiveFindOa implements Serializable{
	
		
	private long anum; // 活動編號 PK(1,1)  
	private String aname;//管理者名稱
	
	public OfficialActiveFindOa() {
		
	}

	public OfficialActiveFindOa(long anum,String aname) {
		this.anum = anum;
		this.aname = aname;
	}


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
	
	
}
