<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 라이프 사이클</title>
</head>
<body>
<h2>JSP 라이프 사이클</h2>
<%!
	private int num1 = 0;
	public void jspInit(){ // 실제로는 오버라이딩한거임
		System.out.println("jspInit() 호출됨");
	}
	public void jspDestroy(){ // 실제로는 오버라이딩한거임
		System.out.println("jspDestroy() 호출됨");
	}
%>
<%
	int num2 = 0;
	num1++;
	num2++;
%>
<ul>
	<li>
	num1: <%= num1 %>
	</li>
	<li> 
	num2: <%= num2 %>
	</li>
	
</ul>
</body>
</html>