<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자</title>
</head>
<body>	
<%= session.getAttribute("userid")%> 계정 로그인 성공!<br>
<form action="logout.jsp">
	<input type="submit" value="로그아웃">
</form>

</body>
</html>