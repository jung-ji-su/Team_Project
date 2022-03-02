package shop;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class ShopSingleAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		ShopDAO sdao = new ShopDAO();
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int[] arr_cnt = new int[5];
		
		for (int i = 0; i < arr_cnt.length; i++) {
			arr_cnt[i] = sdao.getCategoryCnt(i+1);
		}
		
		
		ProductsVO pvo = sdao.getProduct(product_id);
		
		
		request.setAttribute("arr_cnt", arr_cnt);
		request.setAttribute("pvo",  pvo);
		request.setAttribute("list_products", sdao.getList_shop(pvo.getCategory(), 1, 10));
		request.setAttribute("list_review", sdao.getList_review(product_id));
		request.setAttribute("list_pq", sdao.getList_pq(product_id));
		
		forward.setRedirect(false);
		forward.setPath(request.getContextPath() + "/shop-single.jsp");
		
		
		
		return forward;
	}
}
