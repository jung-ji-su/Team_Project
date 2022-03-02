package shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class GetCategoryAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		ShopDAO sdao = new ShopDAO();
		int[] arr_cnt = new int[5];
		
		for (int i = 0; i < arr_cnt.length; i++) {
			arr_cnt[i] = sdao.getCategoryCnt(i+1);
		}
		
		
		int category = Integer.parseInt(request.getParameter("category"));
		
		int categoryCnt = sdao.getCategoryCnt(category);
		
		String temp = request.getParameter("page");
		int page = 0;
		
		page = temp == null ? 1: Integer.parseInt(temp);
		
		//페이징 처리 사이즈
		int pageSize = 12;
		
		int endRow = page*pageSize;
		int startRow = endRow - pageSize +1;
		
		int startPage = (page-1)/pageSize*pageSize+1;
		int endPage = startPage + pageSize -1;
		
		int totalPage = (categoryCnt -1)/pageSize + 1;
		
		endPage = endPage > totalPage ? totalPage : endPage;
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("categoryCnt", categoryCnt);
		
		request.setAttribute("arr_cnt", arr_cnt);
		request.setAttribute("list_category", sdao.getList_shop(category,startRow , endRow));
		request.setAttribute("category", category);
		
		forward.setRedirect(false);
		forward.setPath(request.getContextPath() + "/shop_category.jsp");
		return forward;
	}
}
