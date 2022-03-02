package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class PostListViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		request.setCharacterEncoding("UTF-8");
		
		forward.setPath(request.getContextPath() + "/admin/postListView.jsp");
		forward.setRedirect(false);
		
		
		
		String postKey = request.getParameter("postKey");
		String mindate = request.getParameter("mindate");
		String maxdate = request.getParameter("maxdate");
		String searchKey =  request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		
		switch(postKey) {
			case "1" : 
				request.setAttribute("postKey", postKey);
				request.setAttribute("resultList", adao.getPQPost(mindate,maxdate,searchKey,searchValue));
				break;
			case "2" : 
				request.setAttribute("postKey", postKey);
				request.setAttribute("resultList", adao.getNoticePost(mindate,maxdate,searchKey,searchValue));
				break;
			case "3" : 
				request.setAttribute("postKey", postKey);
				request.setAttribute("resultList", adao.getReviewPost(mindate,maxdate,searchKey,searchValue));
				break;
			case "4" : 
				request.setAttribute("postKey", postKey);
				request.setAttribute("resultList", adao.getQnAPost(mindate,maxdate,searchKey,searchValue));
				break;
		}
		
		return forward;
	}
}	
