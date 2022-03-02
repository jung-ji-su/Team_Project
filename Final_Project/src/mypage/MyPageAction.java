package mypage;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import user.UserVO;

public class MyPageAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		MyPageDAO mdao = new MyPageDAO();
		HttpSession session = request.getSession();
		
		//유저 id
		String user_id = ((UserVO)session.getAttribute("session_user")).getUser_id();
		//주문내역
		request.setAttribute("list_order", mdao.getList_order(user_id));
		//장바구니 리스트
		request.setAttribute("list_cart", mdao.getList_cart(user_id));
		//상품문의 리스트
		request.setAttribute("list_product_q", mdao.getList_product_q(user_id));
		
		
		forward.setRedirect(false);
		forward.setPath(request.getContextPath() + "/mypage.jsp");
		
		
		return forward;
	}
}
