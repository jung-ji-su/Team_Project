package shop;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class ShopDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public ShopDAO() {
		sqlsession = factory.openSession(true);
		// true -> 오토커밋
	}
	
	public List<ProductsVO> getList_shop(int category,int startnum,int endnum){
		HashMap<String, Integer> map = new HashMap<>();
		map.put("category", category);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		return sqlsession.selectList("Shop.getList_shop",map);
	}
	
	public int getCategoryCnt(int category) {
		return sqlsession.selectOne("Shop.getCategoryCnt",category);
	}
	
	public ProductsVO getProduct(int product_id) {
		return sqlsession.selectOne("Shop.getProduct",product_id);
	}
	
	public boolean addCart(int cart_quantity,String user_id,int product_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cart_quantity", cart_quantity);
		map.put("user_id", user_id);
		map.put("product_id", product_id);
		
		if(sqlsession.insert("Shop.addCart",map)==1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean buy(int cart_quantity,String user_id,int product_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cart_quantity", cart_quantity);
		map.put("user_id",user_id );
		map.put("product_id",product_id );
		
		int result1 = sqlsession.insert("Shop.buy1", map);
		int result2 = sqlsession.insert("Shop.buy2", map);
		
		if(result1==1&&result2==1) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<ReviewVO> getList_review(int product_id){
		return sqlsession.selectList("Shop.getList_review",product_id );
	}
	
	public boolean isBought(String user_id,int product_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("product_id", product_id);
		if((int)sqlsession.selectOne("Shop.isBought",map)==0) {
			return false;
		} else {
			return true;
		}
	}
	
	
	public boolean insertReview(int product_id, String title,String content,String user_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("product_id", product_id);
		map.put("title", title);
		map.put("content", content);
		map.put("user_id", user_id);
		if(sqlsession.insert("Shop.insertReview", map)==1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean insertProductQ(int product_id, String title,String content,String user_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("product_id", product_id);
		map.put("title", title);
		map.put("content", content);
		map.put("user_id", user_id);
		
		if(sqlsession.insert("Shop.insertProductQ", map)==1) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<ProductQVO> getList_pq(int product_id){
		return sqlsession.selectList("Shop.getList_pq",product_id );
	}
	
	public List<ProductsVO> searchProducts(String searchValue,int startnum,int endnum){
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchValue", searchValue);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		return sqlsession.selectList("Shop.searchProducts", map);
	}
	
	public int getSearchCnt(String searchValue) {
		return sqlsession.selectOne("Shop.getSearchCnt", searchValue);
	}
}
