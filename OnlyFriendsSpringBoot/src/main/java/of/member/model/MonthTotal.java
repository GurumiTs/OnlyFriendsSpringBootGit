package of.member.model;


public class MonthTotal {
	private Integer month;
	private Float total;
		
	public MonthTotal() {	
	}
	
	public MonthTotal(Integer month, Float total) {
		this.month = month;
		this.total = total;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	public Float getTotal() {
		return total;
	}
	public void setTotal(Float total) {
		this.total = total;
	}
	
	
}
