<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.freeflux.db.DBClass" %>      

<%
	int no=Integer.parseInt(request.getParameter("no"));
	String status=DBClass.hitUp(no);
	
	out.print(status);
	if(status.equals("SUCCESS")){
		response.sendRedirect("detail_form.jsp?no="+no);
	}
%>









