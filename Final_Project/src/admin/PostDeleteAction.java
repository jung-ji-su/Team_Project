package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import util.Function;

public class PostDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		
		String postKey =request.getParameter("postKey");
		int id = Integer.parseInt(request.getParameter("id"));

		if(adao.postDelete(postKey, id)) {
			forward = Function.alert(request, forward, "/admin/postListView.jsp", "삭제 성공");
		} else {
			forward = Function.alert(request, forward, "/admin/postListView.jsp", "삭제 실패");
		}
		
		return forward;
	}
}
