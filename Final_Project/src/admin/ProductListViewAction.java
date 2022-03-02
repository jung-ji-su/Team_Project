package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class ProductListViewAction implements Action{
	
	@Override
	public action.ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		request.setCharacterEncoding("UTF-8");
		
		
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		int category = Integer.parseInt(request.getParameter("category"));
		String mindate = request.getParameter("mindate");
		String maxdate = request.getParameter("maxdate");
		
		request.setAttribute("resultList", adao.getProductList(searchKey, searchValue, category, mindate, maxdate));
		
		
		forward.setPath(request.getContextPath() + "/admin/productListView.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}	
