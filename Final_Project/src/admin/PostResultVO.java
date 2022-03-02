package admin;

public class PostResultVO {
	private String title;
	private String user_id;
	private String contents;
	private int id;
	private String replystate;
	
	public PostResultVO() {
		this.replystate = "처리중";
	}
	public String getReplystate() {
		return replystate;
	}
	public void setReplystate(String replystate) {
		this.replystate = replystate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
}
