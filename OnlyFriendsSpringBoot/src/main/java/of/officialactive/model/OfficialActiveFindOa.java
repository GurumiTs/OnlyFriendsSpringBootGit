package of.officialactive.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class OfficialActiveFindOa implements Serializable{
	
	
	private long anum;
	private String aname;
	
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

	public OfficialActiveFindOa() {
		
	}

	public OfficialActiveFindOa(long anum,String aname) {
		this.anum = anum;
		this.aname = aname;
	}
}
