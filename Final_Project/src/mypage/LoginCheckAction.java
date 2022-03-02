package mypage;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import util.Function;

public class LoginCheckAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("session_user")==null) {
			forward = Function.alert(request, forward, "/index.jsp","로그인후 이용해주세요");
		} else {
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/mypage.mypage");
		}
		
		return forward;
	}
}
