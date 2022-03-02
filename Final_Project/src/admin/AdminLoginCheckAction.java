package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;

public class AdminLoginCheckAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		AdminVO avo = (AdminVO)session.getAttribute("session_admin");
		
		if(avo==null) {
			//비로그인
			forward.setPath(request.getContextPath()+"/admin/login.jsp");
			forward.setRedirect(true);
		} else {
			session.removeAttribute("session_admin");
			forward.setPath(request.getContextPath()+"/admin/index.jsp");
			forward.setRedirect(true);
		}
		return forward;
	}
}
