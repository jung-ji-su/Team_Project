package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import user.UserDAO;
import user.UserVO;
import util.Function;

public class JoinAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		UserVO uvo = new UserVO();
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		uvo.setUser_id(request.getParameter("user_id"));
		uvo.setUser_pw(request.getParameter("user_pw"));
		uvo.setUser_name(request.getParameter("user_name"));
		String user_phoneNum = request.getParameter("user_phonenum1")+
		request.getParameter("user_phonenum2")+request.getParameter("user_phonenum3");
		uvo.setUser_phoneNum(user_phoneNum);
		uvo.setEmail(request.getParameter("user_email"));
		
		if(udao.join(uvo)) {
			//가입성공
			session.setAttribute("session_user", uvo);
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/joinComp.jsp");
		} else {
			//가입실패
			forward = Function.alert(request, forward, "/join.jsp", "가입에 실패하였습니다. 다시 시도해주세요");
		}
		
		
		return forward;
	}
}
