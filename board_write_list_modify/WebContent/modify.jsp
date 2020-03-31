<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.freeflux.db.DBClass, com.freeflux.encode.ChangeEncoding,  java.sql.SQLException, java.sql.ResultSet"%>
<%
	int no=Integer.parseInt(request.getParameter("no"));
	String writer=ChangeEncoding.toLatin(request.getParameter("writer"));
	String title=ChangeEncoding.toLatin(request.getParameter("title"));
	String contents=ChangeEncoding.toLatin(request.getParameter("contents"));

	String status=DBClass.dataUpdate(no, writer, title, contents);
	
	out.print(status);
	
	if(status.equals("SUCCESS")){
		response.sendRedirect("list.jsp");
	}
%>







