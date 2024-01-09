<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String userid= request.getParameter("userid");
	String userpw = request.getParameter("userpw");

	if(userid.equals(userpw)){
		System.out.println(userid + ": 로그인성공");
		response.sendRedirect(request.getContextPath());
	} else{
		System.out.println(userid + ": 로그인 실패");
		response.sendRedirect("ex06-loginForm.jsp");
	}
%>


</body>
</html>