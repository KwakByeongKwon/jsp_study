<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
</head>
<body>
<form action="regist.jsp" method="post">
	<table border="1">
		<tr>
			<th>제목:</th>
			<td>
				<input type="text" name="title" placeholder="제목" required>
			</td>
		</tr>
		<tr>
			<th>작성자:</th>
			<td>
				<input type="text" name="writer" placeholder="작성자" required>
			</td>
		</tr>
		<tr>	
			<th>내용:</th>
			<td>
				<textarea rows="4" cols="20	" name="content" placeholder="내용"></textarea>
			</td>
		</tr>
	</table>
		<input type="submit" value="등록">
</form>
</body>
</html>