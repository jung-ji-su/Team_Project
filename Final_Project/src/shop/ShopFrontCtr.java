package shop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;

@WebServlet("*.shop")
public class ShopFrontCtr extends HttpServlet{
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
		
		if(requestURI.equals("/shop.shop")) {
			forward = new ShopAction().execute(req, resp);
		} else if(requestURI.equals("/getcategory.shop")) {
			forward = new GetCategoryAction().execute(req, resp);
		} else if(requestURI.equals("/shop-single.shop")) {
			forward = new ShopSingleAction().execute(req, resp);
		} else if(requestURI.equals("/addCart.shop")) {
			forward = new AddCartAction().execute(req, resp);
		} else if(requestURI.equals("/buy.shop")) {
			forward = new BuyAction().execute(req, resp);
		} else if(requestURI.equals("/reviewWrite.shop")) {
			forward = new ReviewWriteAction().execute(req, resp);
		} else if(requestURI.equals("/productQWrite.shop")) {
			forward = new productQWriteAction().execute(req, resp);
	    } else if(requestURI.equals("/shop-search.shop")) {
	    	forward = new SearchAction().execute(req, resp);
	    }
		
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
