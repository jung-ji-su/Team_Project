package admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class AdminDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public AdminDAO() {
		sqlsession = factory.openSession(true);
		// true -> 오토커밋
	}
	
	public List<OrderResultVO> getOrderById(String order_idStr,String mindate,String maxdate,String productKey,String productValue){
		HashMap<String, Object> map = new HashMap<>();
		int order_id = Integer.parseInt(order_idStr);
		map.put("order_id", order_id);
		map.put("mindate", mindate);
		map.put("maxdate", maxdate);
		
		
		if(productKey.equals("1")) {
			map.put("productValue", productValue);
			return sqlsession.selectList("Admin.getOrderById1", map);
		} else {
			map.put("productValue", Integer.parseInt(productValue));
			return sqlsession.selectList("Admin.getOrderById2", map);
		}
		
	}
	
	public List<OrderResultVO> getOrderByUserName(String user_name,String mindate,String maxdate,String productKey,String productValue){
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_name", user_name);
		map.put("mindate", mindate);
		map.put("maxdate", maxdate);
		
		if(productKey.equals("1")) {
			map.put("productValue", productValue);
			return sqlsession.selectList("Admin.getOrderByUserName1", map);
		} else {
			map.put("productValue",Integer.parseInt(productValue));
			return sqlsession.selectList("Admin.getOrderByUserName2", map);
		}
		
	}
	
	public List<OrderResultVO> getOrderByUserId(String user_id,String mindate,String maxdate,String productKey,String productValue){
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("mindate", mindate);
		map.put("maxdate", maxdate);
		
		if(productKey.equals("1")) {
			map.put("productValue", productValue);
			return sqlsession.selectList("Admin.getOrderByUserId1", map);
		} else {
			map.put("productValue", Integer.parseInt(productValue));
			return sqlsession.selectList("Admin.getOrderByUserId2", map);
		}
		
		
	}
	
	public List<PostResultVO> getPQPost(String mindate,String maxdate,String searchKey,String searchValue){
		HashMap<String, Object> map = new HashMap<>();
		map.put("mindate", mindate);
		map.put("maxdate", maxdate);
		map.put("searchValue", searchValue);
		if(searchKey.equals("1")) {
			return sqlsession.selectList("Admin.getPQPost1", map);
		}else if(searchKey.equals("2")) {
			return sqlsession.selectList("Admin.getPQPost2", map);
		} else {
			return sqlsession.selectList("Admin.getPQPost3",map);
		}
		
	}
	public List<PostResultVO> getNoticePost(String mindate,String maxdate,String searchKey,String searchValue){
		HashMap<String, Object> map = new HashMap<>();
		map.put("mindate", mindate);
		map.put("maxdate", maxdate);
		map.put("searchValue", searchValue);
		if(searchKey.equals("1")) {
			return sqlsession.selectList("Admin.getNoticePost1", map);
		}else if(searchKey.equals("2")) {
			return sqlsession.selectList("Admin.getNoticePost2", map);
		} else {
			return sqlsession.selectList("Admin.getNoticePost3",map);
		}
		
	}
	public List<PostResultVO> getReviewPost(String mindate,String maxdate,String searchKey,String searchValue){
		HashMap<String, Object> map = new HashMap<>();
		map.put("mindate", mindate);
		map.put("maxdate", maxdate);
		map.put("searchValue", searchValue);
		if(searchKey.equals("1")) {
			return sqlsession.selectList("Admin.getReviewPost1",map);
		}else if(searchKey.equals("2")) {
			return sqlsession.selectList("Admin.getReviewPost2",map);
		} else {
			return sqlsession.selectList("Admin.getReviewPost3",map);
		}
	}
	public List<PostResultVO> getQnAPost(String mindate,String maxdate,String searchKey,String searchValue){
		HashMap<String, Object> map = new HashMap<>();
		map.put("mindate", mindate);
		map.put("maxdate", maxdate);
		map.put("searchValue", searchValue);
		if(searchKey.equals("1")) {
			return sqlsession.selectList("Admin.getQnAPost1",map);
		}else if(searchKey.equals("2")) {
			return sqlsession.selectList("Admin.getQnAPost2",map);
		} else {
			return sqlsession.selectList("Admin.getQnAPost3",map);
		}
	}
	
	public List<ProductResultVO> getProductList(String searchKey,String searchValue,int category,String mindate,String maxdate){
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchValue",searchValue );
		map.put("category",category );
		map.put("mindate",mindate );
		map.put("maxdate",maxdate );
		
		if(searchKey.equals("1")) {
			return sqlsession.selectList("Admin.getProductByName", map);
		} else {
			return sqlsession.selectList("Admin.getProductById", map);
		}
		
	}
	
	public List<UserResultVO> getUserList(String searchKey,String searchValue,String mindate,String maxdate){
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchValue", searchValue);
		map.put("mindate", mindate);
		map.put("maxdate", maxdate);
		
		
		if(searchKey.equals("1")) {
			return sqlsession.selectList("Admin.getUserListByName", map);
		} else if(searchKey.equals("2")) {
			return sqlsession.selectList("Admin.getUserListById", map);
		} else if(searchKey.equals("3")) {
			return sqlsession.selectList("Admin.getUserListByEmail", map);
		} else {
			return sqlsession.selectList("Admin.getUserListByPhone", map);
		}
	}
	
	public boolean insertProduct (ProductVO vo) {
		
		if(sqlsession.insert("Admin.insertProduct", vo)==1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean deleteProduct(int product_id) {
		
		if(sqlsession.delete("Admin.deleteProduct",product_id)==1) {
			return true;
		} else {
			return false;
		}
		
	}
	
	public boolean updateProduct(HashMap<String, Object> map) {
		if(sqlsession.update("Admin.updateProduct",map)==1) {
			return true;
		} else {
			return false;
		}
	}
	
	public AdminVO adminLogin(String id,String pw) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id",id );
		map.put("pw",pw );
		return sqlsession.selectOne("Admin.adminLogin", map);
	}
	
	public boolean updateProfile(HashMap<String, Object> map) {
		if(sqlsession.update("Admin.updateProfile",map)==1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean adminInsert(String manager_id, String mg_pw) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("manager_id", manager_id);
		map.put("mg_pw", mg_pw);
		
		if(sqlsession.insert("Admin.adminInsert", map)==1) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<AdminVO> getAdminList(){
		return sqlsession.selectList("Admin.getAdminList");
	}
	
	public boolean adminDelete(String manager_id) {
		if(sqlsession.delete("Admin.adminDelete", manager_id)==1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean noticeInsert(String manager_id,String title,String content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("manager_id", manager_id);
		map.put("title", title);
		map.put("content", content);
		
		if(sqlsession.insert("Admin.noticeInsert", map)==1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean postDelete(String postKey,int id) {
		int result = 0;
		switch (postKey) {
		case "1":
			result = sqlsession.delete("Admin.postDelete1", id);
			break;
		case "3":
			result = sqlsession.delete("Admin.postDelete2", id);
			break;
		case "4":
			result = sqlsession.delete("Admin.postDelete3", id);
			break;
		}
		if(result==1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean insertReply(String postKey,String title,String contents,int id,String manager_id) {
		int result = 0;
		HashMap<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("contents", contents);
		map.put("id", id);
		map.put("manager_id", manager_id);
		
		
		if(postKey.equals("1")) {
			result = sqlsession.insert("Admin.insertReply1",map);
			sqlsession.update("Admin.updateState1", id);
		} else if(postKey.equals("4")) {
			result = sqlsession.insert("Admin.insertReply2",map);
			sqlsession.update("Admin.updateState2", id);
		}
		
		if(result ==1) {
			return true;
		} else {
			return false;
		}
	}
}
