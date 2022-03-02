package mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class MyPageDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public MyPageDAO() {
		sqlsession = factory.openSession(true);
		// true -> 오토커밋
	}
	
	//해당유저의 주문내역 lirderVOst select
	public List<MyOrderVO> getList_order(String user_id){
		return sqlsession.selectList("Mypage.getList_order", user_id);
	}
	
	// 해당유저의 장바구니 list select
	public List<MyCartVO> getList_cart(String user_id) {
		return sqlsession.selectList("Mypage.getList_cart", user_id);
	}
	
	
	//해당유저의 상품문의 내용 list select
	public List<MyProduct_qVO> getList_product_q(String user_id) {
		List<MyProduct_qVO> list =  sqlsession.selectList("Mypage.getList_product_q", user_id);
		return list;
	}
	
	public boolean cartToOrder(int cart_id) {
		
		if(sqlsession.insert("Mypage.cartToOrder", cart_id)==1&&sqlsession.insert("Mypage.cartToOd", cart_id)==1&&sqlsession.delete("Mypage.deleteCart",cart_id)==1) {
			return true;
		} else {
			return false;
		}
	}
}
