package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import util.Function;

public class AdminLoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward(); 
		AdminDAO adao = new AdminDAO();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		HttpSession session = request.getSession();
		AdminVO avo = adao.adminLogin(id, pw);
		
		if(avo !=null) {
			//성공
			session.setAttribute("session_admin", avo);
			forward.setPath(request.getContextPath() + "/admin/index.jsp");
			forward.setRedirect(true);
		}else {
			forward = Function.alert(request, forward, "/admin/login.jsp", "로그인 실패!");
		}
		
		return forward;
	}
}
