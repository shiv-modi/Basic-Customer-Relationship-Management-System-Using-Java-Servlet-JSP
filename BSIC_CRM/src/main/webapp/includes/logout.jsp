<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
		
		HttpSession session2 = request.getSession(false);
		session2.invalidate();
		response.sendRedirect("../index.jsp");	
	%>