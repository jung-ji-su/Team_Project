package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import util.Function;

public class ProductInsertAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		ProductVO product = new ProductVO();
		request.setCharacterEncoding("UTF-8");
		
		//img
		String savePath = request.getServletContext().getRealPath("images/products");
		MultipartRequest multi = new MultipartRequest(request,savePath, 30*1024*1024, "utf-8",new DefaultFileRenamePolicy());
		String product_imgpath = "images/products/"+multi.getFilesystemName("product_img");
		//server.xml <Host> 안에 
		//<Context path="/images/products" reloadable="true" docBase="C:/teamproject/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/project/images/products"/>
		
		
		
		String product_name = multi.getParameter("product_name");
		int product_price = Integer.parseInt(multi.getParameter("product_price"));
		//String product_imgpath = "/test/test.png";
		String product_detail = multi.getParameter("product_detail");
		//String product_point = request.getParameter("product_point");
		int category = Integer.parseInt(multi.getParameter("category"));
		
		product.setProduct_name(product_name);
		product.setProduct_price(product_price);
		product.setProduct_imgpath(product_imgpath);
		product.setProduct_detail(product_detail);
		//product.setProduct_point("product_point");
		product.setCategory(category);
		
		// redirect로 넘겨줌
		forward.setRedirect(true);
		
		if(adao.insertProduct(product)) {
			// 상품등록 성공 
			forward = Function.alert(request, forward, "/admin/insertProduct.jsp",product_name+" 상품 등록 성공!");
		} else {
			// 상품등록 실패  
			forward = Function.alert(request, forward, "/admin/insertProduct.jsp",product_name+" 상품 등록 실패!");
		}
		
		return forward;
	}
	
}
