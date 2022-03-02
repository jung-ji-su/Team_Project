package shop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import user.UserVO;
import util.Function;

public class AddCartAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		ShopDAO sdao = new ShopDAO();
		
		
		UserVO uvo = (UserVO)request.getSession().getAttribute("session_user");
		int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		if(uvo ==null) {
			forward = Function.alert(request, forward, "/login.jsp", "로그인후 이용해주세요");
		} else {
			if(sdao.addCart(cart_quantity, uvo.getUser_id(), product_id)) {
				forward = Function.alert(request, forward,"/shop-single.shop?product_id="+product_id, "수량 : "+cart_quantity+" 장바구니 담기 성공");
			} else {
				forward = Function.alert(request, forward,"/shop-single.shop?product_id="+product_id, "오류가 발생했습니다 다시 시도해주세요");
			}
		}
		
		
		
		
		return forward;
	}
}
