package admin;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import util.Function;

public class ProfileUpdateAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		AdminDAO adao = new AdminDAO();
		HttpSession session = request.getSession();
		AdminVO avo  = (AdminVO)session.getAttribute("session_admin");
		String savePath = request.getServletContext().getRealPath("images/admin");
		MultipartRequest multi = new MultipartRequest(request,savePath, 30*1024*1024, "utf-8",new DefaultFileRenamePolicy());
		String mg_imgpath = "images/admin/"+multi.getFilesystemName("mg_img");
		String manager_id = avo.getManager_id();
		String mg_name = multi.getParameter("mg_name");
		
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mg_imgpath", mg_imgpath);
		map.put("manager_id", manager_id);
		map.put("mg_name", mg_name);
		
		if(adao.updateProfile(map)) {
			avo.setMg_imgpath(mg_imgpath);
			avo.setMg_name(mg_name);
			session.setAttribute("session_admin", avo);
			forward = Function.alert(request, forward, "/admin/index.jsp" , "수정성공!!");
		}else {
			forward = Function.alert(request, forward, "/admin/adminProfileUpdate.jsp" , "수정실패! 다시 시도해주세요");
		}
		
		return forward;
	}
}
