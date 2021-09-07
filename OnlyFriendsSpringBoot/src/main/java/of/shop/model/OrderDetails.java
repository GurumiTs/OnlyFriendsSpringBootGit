package of.shop.model;


public class OrderDetails {
	private String proName;
	private float subtotal;
	private float total;
	private String currency;
	private String method;
	private String intent;
	private String description;
	
	public OrderDetails() {
		
	}
	

	public OrderDetails(String proName, String subtotal,
            String shipping, String tax, String total, String currency, String method, String intent, String description) {
        this.proName = proName;
        this.subtotal = Float.parseFloat(subtotal);
        this.total = Float.parseFloat(total);
        this.currency = currency;
		this.method = method;
		this.intent = intent;
		this.description = description;
    }
	
	public String getCurrency() {
		return currency;
	}


	public void setCurrency(String currency) {
		this.currency = currency;
	}


	public String getMethod() {
		return method;
	}


	public void setMethod(String method) {
		this.method = method;
	}


	public String getIntent() {
		return intent;
	}


	public void setIntent(String intent) {
		this.intent = intent;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getProName() {
		return proName;
	}


	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}


	public void setTotal(float total) {
		this.total = total;
	}


	
	public String getProductName() {
        return proName;
    }
 
    public String getSubtotal() {
        return String.format("%.2f", subtotal);
    }
 
     
    public String getTotal() {
        return String.format("%.2f", total);
    }

	public void setProName(String proName) {
		this.proName = proName;
	}

	
	
}
