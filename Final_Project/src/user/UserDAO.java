package user;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import util.Function;

public class UserDAO {
	
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public UserDAO() {
		sqlsession = factory.openSession(true);
		// true -> 오토커밋
	}
	
	//가입
	public boolean join(UserVO uvo) {
		
		boolean result = false;
		uvo.setUser_pw(new Function().encryption(uvo.getUser_pw()));
		if(sqlsession.insert("User.join",uvo)==1) {
			//가입 성공
			result = true;
		}
		
		
		return result;
	}
	
	//로그인
	public UserVO login(String user_id,String user_pw) {
		
		user_pw = new Function().encryption(user_pw);
		HashMap<String, String> datas = new HashMap<>();
		datas.put("user_id", user_id);
		datas.put("user_pw", user_pw);
		
		
		return sqlsession.selectOne("User.login", datas);
	}
	
	//아이디 중복검사(ajax)
	public boolean checkId(String user_id) {
		boolean result = false;
		user_id = user_id.trim();
		int cnt = sqlsession.selectOne("User.checkId",user_id);
		
		if(cnt == 0) {
			result = true;
		} 
			
		return result;
	}
	
	//이메일 중복검사
	public boolean checkEmail(String user_email) {
		user_email = user_email.trim();
		boolean result = false;
		int cnt = sqlsession.selectOne("User.checkEmail",user_email);
		
		if(cnt == 0) {
			result = true;
		} 
		return result;
	}
	
	//아이디 찾기
	public String find_id(String user_name,String user_email) {
		String id = null;
		
		HashMap<String, String> datas = new HashMap<>();
		datas.put("user_name", user_name);
		datas.put("user_email", user_email);
		
		id = sqlsession.selectOne("User.find_id",datas);
		
		return id;
	}
	
	//비밀번호 찾기
	public boolean find_pw(String user_id, String user_email) {
		boolean result = true;
		HashMap<String, String> datas = new HashMap<>();
		datas.put("user_id", user_id);
		datas.put("user_email", user_email);
		
		int cnt = sqlsession.selectOne("User.find_pw",datas);
		
		
				if(cnt== 0) {
					result = false;
				}
		return result;
	}
	
	//비밀번호 변경
	public void update_pw(String user_pw,String user_id) {
		user_pw = new Function().encryption(user_pw);
		
		HashMap<String, String> datas = new HashMap<>();
		datas.put("user_pw", user_pw);
		datas.put("user_id", user_id);
		
		sqlsession.update("User.update_pw", datas);
		
	}
	
	public boolean insertQnA(String title,String contents,String user_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("contents", contents);
		map.put("user_id",user_id );
		
		if(sqlsession.insert("User.insertQnA", map)==1) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<NoticeVO> getList_notice(){
		return sqlsession.selectList("User.getList_notice");
	}
}
