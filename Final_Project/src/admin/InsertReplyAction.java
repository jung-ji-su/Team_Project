package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import util.Function;

public class InsertReplyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		AdminVO avo = (AdminVO)session.getAttribute("session_admin");
		
		
		
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String postKey = request.getParameter("postKey");
		int id = Integer.parseInt(request.getParameter("id"));
		String manager_id = avo.getManager_id();
		
		if(adao.insertReply(postKey, title, contents, id, manager_id)) {
			forward = Function.alert(request, forward, "/admin/postListView.jsp", "답변등록 성공");
		}else {
			forward = Function.alert(request, forward, "/admin/postListView.jsp", "답변등록 실패");
		}
		
		return forward;
	}
}
