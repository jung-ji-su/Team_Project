package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import util.Function;

public class OrderListViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		request.setCharacterEncoding("UTF-8");
		
		forward.setPath(request.getContextPath() + "/admin/orderListView.jsp");
		forward.setRedirect(false);
		
		
		
		String searchKey =  request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		String mindate = request.getParameter("mindate");
		String maxdate = request.getParameter("maxdate");
		String productKey = request.getParameter("productKey");
		String productValue = request.getParameter("productValue");
		
		if(searchValue.equals("")) {
			forward = Function.alert(request, forward, "/admin/orderListView.jsp","검색어를 입력해주세요");
			return forward;
		} else if(productValue.equals("")&&productKey.equals("2")) {
			forward = Function.alert(request, forward, "/admin/orderListView.jsp","오류 발생! 다시 시도해주세요");
			return forward;
		} else if(searchKey.equals("2")) {
			forward = Function.alert(request, forward, "/admin/orderListView.jsp","배송기능은 미구현상태입니다 ^ㅡ^");
		}
		
		switch(searchKey) {
			case "1":
				request.setAttribute("resultList", adao.getOrderById(searchValue,mindate,maxdate,productKey,productValue));
				break;
			case "3":
				request.setAttribute("resultList", adao.getOrderByUserName(searchValue,mindate,maxdate,productKey,productValue));
				break;
			case "4": 
				request.setAttribute("resultList", adao.getOrderByUserId(searchValue,mindate,maxdate,productKey,productValue));
				break;
		}
		
		
		return forward;
	}
}
