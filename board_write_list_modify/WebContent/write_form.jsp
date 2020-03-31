<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 방식 -->
<html>
<head>
<meta charset="UTF-8"> <!-- HTML5 방식 -->
<title>글쓰기 화면</title>
</head>
<body>
	<h1>글쓰기</h1>
	<form action="write.jsp" method="get">
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text"  size="20" name="writer"  required="required" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text"  size="59" name="title" required="required" /></td> 
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="60"  name="contents" required="required"></textarea></td>
			</tr>
			<tr><td></td>
				<td>
				<input type="button"  value="글목록" onclick="location.href='list.jsp'" />
				<input type="submit"  value="글저장" />
				<input type="reset"  name="취소" />
			</td></tr>
		</table>
	</form>
</body>
</html>






