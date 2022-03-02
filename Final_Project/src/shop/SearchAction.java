package shop;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class SearchAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		ShopDAO sdao = new ShopDAO();
		int[] arr_cnt = new int[5];
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		for (int i = 0; i < arr_cnt.length; i++) {
			arr_cnt[i] = sdao.getCategoryCnt(i+1);
		}
		
		String searchValue = request.getParameter("searchValue");
		int searchCnt = sdao.getSearchCnt(searchValue);
		
		String temp = request.getParameter("page");
		int page = 0;
		
		page = temp == null ? 1: Integer.parseInt(temp);
		
		//페이징 처리 사이즈
		int pageSize = 12;
		
		int endRow = page*pageSize;
		int startRow = endRow - pageSize +1;
		
		int startPage = (page-1)/pageSize*pageSize+1;
		int endPage = startPage + pageSize -1;
		
		int totalPage = (searchCnt -1)/pageSize + 1;
		
		endPage = endPage > totalPage ? totalPage : endPage;
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("searchCnt", searchCnt);
		
		request.setAttribute("arr_cnt", arr_cnt);
		request.setAttribute("list_products", sdao.searchProducts(searchValue, startRow, endRow));
		request.setAttribute("searchValue", searchValue);
		
		forward.setRedirect(false);
		forward.setPath(request.getContextPath() + "/shop_search.jsp");
		return forward;
	}
}
