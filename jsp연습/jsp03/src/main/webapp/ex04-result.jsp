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
	request.setCharacterEncoding("utf-8");
	String name= request.getParameter("name");
	String address = request.getParameter("address");
	String[] animals = request.getParameterValues("animal");	
	
	System.out.println("name:" + name);
	System.out.println("address:" + address);
	for(String animal:animals){
		System.out.println("animal:" + animal);
	}
%>
<h1>
전송 되었습니다.
</h1>
<h1>

</h1>

</body>
</html>