package mypage;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import util.Function;

public class CartToOrderAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		MyPageDAO mdao = new MyPageDAO();
		
		if(request.getParameter("cart_id")==null) {
			return Function.alert(request, forward, "/mypage.mypage", "상품을 체크한뒤 주문버튼을 눌러주세요");
		}
		
		String[] arr_param = request.getParameterValues("cart_id");
		int[] arr_cart_id = new int[arr_param.length];
		for (int i = 0; i < arr_param.length; i++) {
			arr_cart_id[i] = Integer.parseInt(arr_param[i]);
			if(!mdao.cartToOrder(arr_cart_id[i])) {
				forward = Function.alert(request, forward, "/mypage.mypage","주문중 오류가 발생했습니다. 다시 시도해주세요");
				return forward;
			}
		}
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/mypage.mypage");
		
		return forward;
	}
}
