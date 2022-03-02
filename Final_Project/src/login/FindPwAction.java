package login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import user.UserDAO;
import util.Function;

public class FindPwAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		Function f = new Function();
		
		String user_id = request.getParameter("user_id");
		String user_email = request.getParameter("user_email");
		String user_phonenum = 
		request.getParameter("user_phonenum1")+request.getParameter("user_phonenum2")+request.getParameter("user_phonenum3");
		String randomPw = f.randomPW();
		
		if(udao.find_pw(user_id, user_email)){
			f.sendSMS_pw(user_phonenum,randomPw);
			udao.update_pw(randomPw, user_id);
			forward = Function.alert(request, forward, "/login.jsp","임시비밀번호가 문자로 발송되었습니다.");
		} else{
			forward = Function.alert(request, forward, "/find_pw.jsp","해당되는 정보가 없습니다. 입력한 정보를 확인해주세요");
		}
		
		
		return forward;
	}
}
