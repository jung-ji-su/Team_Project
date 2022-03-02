package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class UserListViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		request.setCharacterEncoding("UTF-8");
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		String mindate = request.getParameter("mindate");
		String maxdate = request.getParameter("maxdate");
		
		request.setAttribute("resultList", adao.getUserList(searchKey, searchValue, mindate, maxdate));
		
		forward.setPath(request.getContextPath() + "/admin/userListView.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
