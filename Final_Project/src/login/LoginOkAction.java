package login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import user.UserDAO;
import user.UserVO;
import util.Function;

public class LoginOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		UserVO uvo = udao.login(user_id, user_pw);
		HttpSession session = request.getSession();
		
		
		if(uvo !=null){
			//로그인 성공
			session.setAttribute("session_user", uvo);
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/index.jsp");
		} else {
			forward = Function.alert(request, forward,"/login.jsp","로그인 실패! 입력한 정보를 확인해주세요");
		}
		return forward;
	}
	
}
