<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 기본 문법</title>
</head>
<body>
<h2>JSP 기본 문법 예제</h2>
<%
	// Scriptet: 자바코드를 작성할 수 있는 영역(연산, 처리기능 정의)
	String str = "스크립틀릿 입니다.";
	String comment = "주석";
%>

선언문: <%= declration %> <br> <!-- 표현식: 값을 출력(처리, 연산 코드 사용 불가) -->

스크립틀릿: <%= str %> <br>
<!-- <%= comment %> -->
<%-- <%= comment %> --%>

<%!
	private String declration = "선언문";
%>
</body>
</html>