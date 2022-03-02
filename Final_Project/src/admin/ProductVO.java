package admin;

public class ProductVO {
	
	private String product_name;		// 상품명
	private int product_price;		// 가격
	private String product_imgpath;		// 이미지
	private String product_detail;		// 상품설명
	private int category;
	
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_imgpath() {
		return product_imgpath;
	}
	public void setProduct_imgpath(String product_imgpath) {
		this.product_imgpath = product_imgpath;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	
	
	


}
