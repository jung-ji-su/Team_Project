package login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import user.UserDAO;

public class NoticeAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		
		request.setAttribute("noticeList", udao.getList_notice());
		forward.setRedirect(false);
		forward.setPath(request.getContextPath()+"/notice.jsp");
		
		return forward;
	}
}
