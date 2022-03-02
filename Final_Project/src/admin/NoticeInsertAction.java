package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import util.Function;

public class NoticeInsertAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		HttpSession session = request.getSession();
		AdminVO avo = (AdminVO)session.getAttribute("session_admin");
		
		String manager_id = avo.getManager_id();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		if(adao.noticeInsert(manager_id, title, content)) {
			forward = Function.alert(request, forward, "/admin/noticeInsert.jsp", "공지 작성 성공!");
		}else {
			forward = Function.alert(request, forward, "/admin/noticeInsert.jsp", "공지 작성 실패");
		}
		
		return forward;
	}
}
