<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% 
	// 세션의 유효 시간 설정(초단위)
	 session.setMaxInactiveInterval(10);
	SimpleDateFormat formatter =
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	Date creationTime = new Date();
	creationTime.setTime(session.getCreationTime()); // 세션이 생성된 시간
	
	Date lastAccessedTime = new Date();
	lastAccessedTime.setTime(session.getLastAccessedTime()); // 마지막 접근 시간
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보 확인</title>
</head>
<body>
세션ID: <%= session.getId() %><br>
최초 세션 생성 시간: <%= formatter.format(creationTime) %><br>
마지막 접근 시간: <%= formatter.format(lastAccessedTime) %><br>
</body>
</html>