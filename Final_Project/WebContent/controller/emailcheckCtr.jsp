<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String user_email = request.getParameter("user_email");
		UserDAO udao = new UserDAO();
		
		if(udao.checkEmail(user_email)){
			//중복안됨 (가입가능)
			System.out.println("ok");
			out.print("ok");
		} else{
			//중복됨
			System.out.println("not-ok");
			out.print("not-ok");
		}
%>