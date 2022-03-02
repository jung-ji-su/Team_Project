<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String user_id = request.getParameter("user_id");
		UserDAO udao = new UserDAO();
		
		if(udao.checkId(user_id)){
			//중복안됨 (가입가능)
			out.print("ok");
		} else{
			//중복됨
			out.print("not-ok");
		}
%>