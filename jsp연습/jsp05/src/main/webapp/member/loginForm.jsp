<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
    
<%
	String loginId = (String)session.getAttribute("userid");		
	if(loginId != null){
		System.out.println("로그인 되어 있는 상태");
		response.sendRedirect("loginSuccess.jsp");	
	} else{
		String checked = "";
		String userid = "";
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0){
			for(int i = 0; i < cookies.length; i++){
				if(cookies[i].getName().equals("remember")){
					checked = "checked";
					userid = cookies[i].getValue();
				}
			}
		}
%>
	<!DOCTYPE html>
	<html>	
	<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	</head>
	<body>
	<form action="loginProc.jsp" method="post">
		<input type="text" name="userid" placeholder="아이디" value="<%= userid %>"><br>
		<input type="password" name="userpw" placeholder="비밀번호"><br>
		아이디 기억하기<input type="checkbox" name="remember" value="chk" <%= checked %>><br>
		<input type="submit" value="로그인">
	</form>
	
	</body>
	</html>
<% } %>