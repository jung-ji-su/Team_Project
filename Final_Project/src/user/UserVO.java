package user;

public class UserVO {
//	user_id varchar2(20) PRIMARY KEY,
//	user_pw varchar2(20) NOT NULL,
//	user_name varchar2(10) NOT NULL,
//	user_addr varchar2(50) NOT NULL,
//	user_phoneNum varchar2(11) NOT NULL,
//	user_email varchar2(40) NOT NULL,
//	-- SYSDATE
//	user_joindate date NOT NULL
	
	String user_id;
	String user_pw;
	String user_name;
	String user_addr;
	String user_phoneNum;
	String email;
	String user_joindate;
	
	public UserVO() {
		this.user_addr = "defalut";
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_phoneNum() {
		return user_phoneNum;
	}
	public void setUser_phoneNum(String user_phoneNum) {
		this.user_phoneNum = user_phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUser_joindate() {
		return user_joindate;
	}
	public void setUser_joindate(String user_joindate) {
		this.user_joindate = user_joindate;
	}
}
