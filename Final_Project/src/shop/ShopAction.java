package shop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class ShopAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		ShopDAO sdao = new ShopDAO();
		
		int[] arr_cnt = new int[5];
		
		for (int i = 0; i < arr_cnt.length; i++) {
			arr_cnt[i] = sdao.getCategoryCnt(i+1);
		}
		
		request.setAttribute("list_category1", sdao.getList_shop(1, 1 , 4));
		request.setAttribute("list_category2", sdao.getList_shop(2, 1 , 4));
		request.setAttribute("list_category3", sdao.getList_shop(3, 1 , 4));
		request.setAttribute("list_category4", sdao.getList_shop(4, 1 , 4));
		request.setAttribute("list_category5", sdao.getList_shop(5, 1 , 4));
		
		
		request.setAttribute("arr_cnt", arr_cnt);
		
		forward.setRedirect(false);
		forward.setPath(request.getContextPath() + "/shop.jsp");
		
		
		
		return forward;
	}
}
