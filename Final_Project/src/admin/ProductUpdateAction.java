package admin;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import util.Function;

public class ProductUpdateAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		HashMap<String, Object> map = new HashMap<>();
		request.setCharacterEncoding("UTF-8");
		String savePath = request.getServletContext().getRealPath("images/products");
		MultipartRequest multi = new MultipartRequest(request,savePath, 30*1024*1024, "utf-8",new DefaultFileRenamePolicy());
		String product_imgpath = "images/products/"+multi.getFilesystemName("product_img");
		int product_id = Integer.parseInt(multi.getParameter("product_id"));
		
		map.put("product_imgpath", product_imgpath);
		map.put("product_id", product_id);
		map.put("product_name", multi.getParameter("product_name"));
		map.put("product_price", Integer.parseInt(multi.getParameter("product_price")));
		map.put("product_detail", multi.getParameter("product_detail"));
		map.put("category", Integer.parseInt(multi.getParameter("category")));
		
		
		if(adao.updateProduct(map)) {
			//성공
			forward = Function.alert(request, forward, "/admin/productListView.jsp",product_id+"번 상품 수정 성공!");
		}else {
			//실패
			forward = Function.alert(request, forward, "/admin/productListView.jsp",product_id+"번 상품 수정 실패!");
		}
		
		
		return forward;
	}
}
