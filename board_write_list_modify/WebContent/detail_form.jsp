<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.freeflux.db.DBClass, com.freeflux.encode.ChangeEncoding,  java.sql.SQLException, java.sql.ResultSet" %>    
<%
	int no=Integer.parseInt(request.getParameter("no"));	
	ResultSet rs=DBClass.dataSelectOne(no);
	rs.next();
	String writer=ChangeEncoding.toUnicode(rs.getString(1));
	String title=ChangeEncoding.toUnicode(rs.getString(2));
	String contents=ChangeEncoding.toUnicode(rs.getString(3));
%> 
<!DOCTYPE html> <!-- HTML5 방식 -->
<html>
<head>
<meta charset="UTF-8"> <!-- HTML5 방식 -->
<title>글 상세 화면</title>
</head>
<body>
	<h1>글 상세보기</h1>
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text"  size="20" readonly="readonly" value=<%= writer %> /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text"  size="59" readonly="readonly" value=<%= title %> /></td> 
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="60"  readonly="readonly" ><%= contents %></textarea></td>
			</tr>
			<tr><td></td>
				<td>
				<input type="button"  value="글목록" onclick="location.href='list.jsp'" />
				<input type="button" value="글수정" onclick="location.href='modify_form.jsp?no=<%= no %>'" />
				</td>
			</tr>
		</table>
</body>
</html>






