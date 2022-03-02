package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import util.Function;

public class AdminInsertAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		
		String manager_id = request.getParameter("manager_id");
		String mg_pw =  request.getParameter("mg_pw");
		
		if(adao.adminInsert(manager_id, mg_pw)) {
			forward = Function.alert(request, forward, "/admin/adminInsert.jsp", "관리자 계정 생성 성공!");
		} else {
			forward = Function.alert(request, forward, "/admin/adminInsert.jsp", "오류발생. 다시 시도해주세요");
		}
		return forward;
	}
}
