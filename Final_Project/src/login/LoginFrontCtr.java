package login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import action.ActionForward;


@WebServlet("*.login")
public class LoginFrontCtr extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		if(requestURI.equals("/login.login")) {
			forward = new LoginAction().execute(req, resp);
		} else if (requestURI.equals("/loginOk.login")) {
			forward = new LoginOkAction().execute(req, resp);
		} else if(requestURI.equals("/join.login")) {
			forward = new JoinAction().execute(req, resp);
		} else if(requestURI.equals("/findid.login")) {
			forward = new FindIdAction().execute(req, resp);
		} else if(requestURI.equals("/findpw.login")) {
			forward = new FindPwAction().execute(req, resp);
		} else if(requestURI.equals("/qnaOk.login")) {
			forward = new QnaOkAction().execute(req, resp);
		} else if(requestURI.equals("/notice.login")) {
			forward = new NoticeAction().execute(req, resp);
		} else if(requestURI.equals("/qna.login")) {
			forward = new QnaAction().execute(req, resp);
		}
		
		// 일괄처리
		if( forward != null ) {
			if( forward.isRedirect() ) {
				// redirect 방식
				resp.sendRedirect(forward.getPath());
			} else {
				// forward방식
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
		
	}
}
