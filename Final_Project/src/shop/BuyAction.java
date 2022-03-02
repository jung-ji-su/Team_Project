package shop;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import user.UserVO;
import util.Function;

public class BuyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		
		ShopDAO sdao = new ShopDAO();
		
		int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		UserVO uvo = (UserVO)request.getSession().getAttribute("session_user");
		
		if(uvo==null) {
			forward = Function.alert(request, forward, "/login.jsp", "로그인 후 이용해주세요");
		}else {
			if(sdao.buy(cart_quantity, uvo.getUser_id(), product_id)) {
				forward = Function.alert(request, forward,"/shop-single.shop?product_id="+product_id, "주문 성공!");
			} else {
				forward = Function.alert(request, forward,"/shop-single.shop?product_id="+product_id, "오류 발생 다시 시도해주세요!");
			}
		}
		
		return forward;
	}
}
