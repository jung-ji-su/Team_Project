package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class AdminDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		
		request.setAttribute("resultList", adao.getAdminList());
		
		forward.setPath(request.getContextPath()+"/admin/adminDelete.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
