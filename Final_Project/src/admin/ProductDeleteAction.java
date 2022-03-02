package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import util.Function;

public class ProductDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		forward.setRedirect(true);
		
		
		if(adao.deleteProduct(product_id)) {
			//삭제성공
			forward = Function.alert(request, forward, "/admin/productListView.jsp",product_id+"번 상품이 삭제되었습니다.");
		} else {
			//실패
			forward = Function.alert(request, forward, "/admin/productListView.jsp",product_id+"번 상품을 삭제하는중 오류가 발생했습니다.");
		}
		
		
		
		return forward;
	}
}
