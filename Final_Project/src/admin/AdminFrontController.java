package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.ActionForward;

@WebServlet("*.admin")
public class AdminFrontController extends HttpServlet {

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
		HttpSession session = req.getSession();
		if(((AdminVO)session.getAttribute("session_admin"))==null&&!requestURI.equals("/login.admin")&&!requestURI.equals("/loginCheck.admin")) {
			//비로그인
			
			forward = new ToLoginAction().execute(req, resp);
		}else {
			//로그인
			if(requestURI.equals("/orderListView.admin")) {
				forward = new OrderListViewAction().execute(req, resp);
			} else if(requestURI.equals("/postListView.admin")) {
				forward = new PostListViewAction().execute(req, resp);
			} else if(requestURI.equals("/productListView.admin")) {
				forward = new ProductListViewAction().execute(req, resp);
			} else if(requestURI.equals("/userListView.admin")) {
				forward = new UserListViewAction().execute(req, resp);
			} else if(requestURI.equals("/productInsert.admin")) {
				forward = new ProductInsertAction().execute(req, resp);
			} else if (requestURI.equals("/productDelete.admin")) {
				forward =  new ProductDeleteAction().execute(req, resp);
			} else if(requestURI.equals("/productUpdate.admin")) {
				forward =  new ProductUpdateAction().execute(req, resp);
			} else if(requestURI.equals("/login.admin")) {
				forward =  new AdminLoginAction().execute(req, resp);
			} else if(requestURI.equals("/profileUpdate.admin")) {
				forward = new ProfileUpdateAction().execute(req, resp);
			} else if(requestURI.equals("/loginCheck.admin")) {
				forward = new AdminLoginCheckAction().execute(req, resp);
			} else if(requestURI.equals("/adminInsert.admin")) {
				forward = new AdminInsertAction().execute(req, resp);
			} else if(requestURI.equals("/adminDelete.admin")) {
				forward = new AdminDeleteAction().execute(req, resp);
			} else if(requestURI.equals("/adminDeleteOk.admin")) {
				forward = new AdimDeleteOkAction().execute(req, resp);
			} else if(requestURI.equals("/noticeInsert.admin")) {
				forward = new NoticeInsertAction().execute(req, resp);
			} else if(requestURI.equals("/postDelete.admin")) {
				forward = new PostDeleteAction().execute(req, resp);
			} else if(requestURI.equals("/insertReply.admin")) {
				forward = new InsertReplyAction().execute(req, resp);
			}
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

