package shop;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import user.UserVO;
import util.Function;

public class productQWriteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		ShopDAO sdao = new ShopDAO();
		request.setCharacterEncoding("utf-8");
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		UserVO uvo = (UserVO)session.getAttribute("session_user");
		String user_id = "";
		
		if(uvo==null) {
			//비로그인시
			return Function.alert(request, forward, "/login.jsp", "로그인후 이용해주세요");
		} else {
			user_id = uvo.getUser_id();
		}
		
		if(sdao.insertProductQ(product_id, title, content, user_id)) {
			//성공시
			forward.setPath(request.getContextPath() + "/shop-single.shop?product_id="+product_id);
			forward.setRedirect(true);
		}else {
			//실패시
			forward = Function.alert(request, forward, "/shop-single.shop?product_id="+product_id, "오류가 발생했습니다 다시 시도해주세요");
		}
		
		
		
		
		return forward;
	}
}
