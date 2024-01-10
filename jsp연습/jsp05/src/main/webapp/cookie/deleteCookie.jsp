<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("name")){
				Cookie cookie = new Cookie("name",""); // 이름은 뭐가되도 상관없음.
				cookie.setMaxAge(0); // 유효시간을 0으로 만들어서 저장함 그러면 생성되자마자 사라짐
				response.addCookie(cookie);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 삭제</title>
</head>
<body>
쿠키가 삭제 되었습니다.
</body>
</html>