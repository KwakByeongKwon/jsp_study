<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청을 받음</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	System.out.println("전송받은 값:" + name);
	
	if(name.equals("원빈")){
%>
	<%= name %>님 환영합니다.
<% }else {%>
	누구세요?
<% } %>
</body>
</html>