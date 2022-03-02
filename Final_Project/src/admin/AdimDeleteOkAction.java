package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import util.Function;

public class AdimDeleteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		String manager_id = request.getParameter("manager_id");
		
		if(adao.adminDelete(manager_id)) {
			forward = Function.alert(request, forward, "/adminDelete.admin", "삭제성공");
		}else {
			forward = Function.alert(request, forward,"/adminDelete.admin", "삭제 실패! 다시 시도해주세요");
		}
		
		return forward;
	}
}
