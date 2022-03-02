package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		if(session.getAttribute("session_user")==null) {
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/login.jsp");
		}else {
			session.removeAttribute("session_user");
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/index.jsp");
		}
		
		
		return forward;
	}
	
}
