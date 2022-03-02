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

public class QnaOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String user_id = ((UserVO)session.getAttribute("session_user")).getUser_id();
		
		
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		
		if(udao.insertQnA(title, contents,user_id)) {
			forward = Function.alert(request, forward, "/qna.jsp", "문의 작성 성공");
		}else {
			forward = Function.alert(request, forward, "/qna.jsp", "문의 작성 실패");
		}
		return forward;
	}
}
