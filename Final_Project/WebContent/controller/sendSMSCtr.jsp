<%@page import="util.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		Function f = new Function();
		String num = f.sendSMS(request.getParameter("user_phonenum"));
		out.print(num);
	%>
