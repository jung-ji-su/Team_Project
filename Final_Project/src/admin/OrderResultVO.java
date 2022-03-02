package admin;

public class OrderResultVO {

	private String order_date;
	private int order_id;
	private String user_id;
	private String product_name;
	private int od_quantity;
	private int order_totalprice;
	
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getOd_quantity() {
		return od_quantity;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public void setOd_quantity(int od_quantity) {
		this.od_quantity = od_quantity;
	}
	public int getOrder_totalprice() {
		return order_totalprice;
	}
	public void setOrder_totalprice(int order_totalprice) {
		this.order_totalprice = order_totalprice;
	}
	
	
	
}
