<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.freeflux.db.DBClass" %>    
<%
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String contents=request.getParameter("contents");
	
	String status=DBClass.dataInsert(writer, title, contents);
	
	out.print(status);
	out.print("<br />");
	out.print("<a href='list.jsp'>게시판 글목록 화면으로 이동</a>");
%>