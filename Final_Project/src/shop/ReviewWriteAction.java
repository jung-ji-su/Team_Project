package shop;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import user.UserVO;
import util.Function;

public class ReviewWriteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		ShopDAO sdao = new ShopDAO();
		request.setCharacterEncoding("utf-8");
		
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		UserVO uvo = (UserVO)session.getAttribute("session_user");
		String user_id = "";
		
		if(uvo==null) {
			//비로그인시
			return Function.alert(request, forward, "/login.jsp", "로그인후 이용해주세요");
		} else {
			user_id = uvo.getUser_id();
		}
		
		// 구매한적이 있는지 판단
		if(sdao.isBought(user_id, product_id)) {
			//구매한적있을때
			if(sdao.insertReview(product_id, title, content, user_id)){
				//리뷰등록성공
				forward.setPath(request.getContextPath() + "/shop-single.shop?product_id="+product_id);
				forward.setRedirect(true);
			} else {
				//리뷰 등록실패
				forward = Function.alert(request, forward, "/shop-single.shop?product_id="+product_id, "오류가 발생했습니다 다시 시도해주세요");
			}
		} else {
			//구매한적없을때
			forward = Function.alert(request, forward, "/shop-single.shop?product_id="+product_id, "리뷰는 해당 상품을 구매하신 회원님만 작성 가능합니다.");
		}
		
		
		
		
		return forward;
	}
}
