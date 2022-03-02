package login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import user.UserDAO;
import util.Function;

public class FindIdAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		
		response.setContentType("text/html; charset=UTF-8");
		
		
		String id = udao.find_id(user_name, user_email);
		 if(id==null) {
			forward = Function.alert(request, forward, "/find_id.jsp","입력한 정보에 해당되는 아이디가 없습니다.");
		 } else {
			 request.setAttribute("idstr","당신의 아이디는"+ id+"입니다.");
			 forward.setRedirect(false);
			 forward.setPath(request.getContextPath() + "/find_id_Comp.jsp");
		 }
		
		
		
		return forward;
	}
}
