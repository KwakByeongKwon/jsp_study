<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP예제</title>
</head>
<body>
<%
	java.util.Random ran = new java.util.Random();
	int ranNum = ran.nextInt(10);
	int total = 0;
	for(int i = 1; i <= ranNum; i++){
		total += i;
	}
	System.out.println("처리함");
%>

	1부터 <%= ranNum %>까지의 합: <%= total %>

</body>
</html>