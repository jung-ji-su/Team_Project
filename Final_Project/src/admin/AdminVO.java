package admin;

public class AdminVO {
	private String manager_id;
	private String mg_password;
	private String mg_name;
	private String mg_imgpath;
	private String authority;
	
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getMg_imgpath() {
		return mg_imgpath;
	}
	public void setMg_imgpath(String mg_imgpath) {
		this.mg_imgpath = mg_imgpath;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getMg_password() {
		return mg_password;
	}
	public void setMg_password(String mg_password) {
		this.mg_password = mg_password;
	}
	public String getMg_name() {
		return mg_name;
	}
	public void setMg_name(String mg_name) {
		this.mg_name = mg_name;
	}
	
	
}
