<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.freeflux.db.DBClass, com.freeflux.encode.ChangeEncoding,  java.sql.SQLException, java.sql.ResultSet" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록 화면</title>
</head>
<body>
<h1>글목록</h1>
	<table border="1">
		<tr><th>번호</th><th>제목</th><th>글쓴이</th><th>조회수</th></tr>
		<% 
			ResultSet rs=DBClass.dataSelectAll();
			if(rs!=null){
				int no=0;
				String writer=null;
				String title=null;
				
				while(rs.next()){
					no=rs.getInt(1);
					writer=ChangeEncoding.toUnicode(rs.getString(2));
					title=ChangeEncoding.toUnicode(rs.getString(3));
		%>
		
		<tr>
			<td><%= no %></td>
			<td><%= writer %></td>
			<td><a href=hit.jsp?no=<%= no %> > <%= title %> </a></td>
			<td><%= rs.getInt(4) %></td>
		</tr>
		
		<% } 
			}else{
		%>
				<tr><td>입력된 데이터가 없습니다.</td></tr>
		<%
			}
		%>
	</table>
	<br />
	<input type="button" value="글쓰기" onclick="location.href='write_form.jsp'" />
</body>
</html>



