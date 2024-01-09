<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REDIRECT</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	System.out.println("redirect.jsp에서 request파라미터 확인");
	System.out.println("이름:" + name);
	System.out.println("나이:" + age);
	System.out.println("redirect_ret으로 요청을 전달");
	
	response.sendRedirect("redirect_ret.jsp");
%>
</body>
</html>