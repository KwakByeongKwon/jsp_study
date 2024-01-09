<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>덧셈 결과</title>
</head>
<body>
<%
	int n1 = Integer.parseInt(request.getParameter("n1"));
	int n2 = Integer.parseInt(request.getParameter("n2"));
	System.out.println("덧셈 결과:" + (n1 + n2));
	
%>
<h1>
	덧셈 결과
</h1>
<h1>
	<%= n1 %> + <%= n2 %> = <%= (n1+n2) %>
</h1>

</body>
</html>