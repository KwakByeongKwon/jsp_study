<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
//	1. 요청에서 파라미터 가져오기
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	String remember = request.getParameter("remember");
	
	System.out.println("userid:" + userid);
	System.out.println("userpw:" + userpw);
	System.out.println("remember:" + remember);
	
/*
	2. 아이디와 비밀번호가 같으면 로그인 성공으로 처리
		- 아이디 기억하기 여부에 따라 쿠키를 생성해서 응답을 만듬(1시간 유지)
*/ 
	if(userid.equals(userpw)){
		System.out.println("로그인 성공!");
		session.setAttribute("userid",userid);  // 세션에 저장
		
		if(remember != null){
			Cookie rememberCookie = new Cookie("remember",userid);
			rememberCookie.setMaxAge(60 * 60);
			response.addCookie(rememberCookie);
		} else {
			Cookie rememberCookie = new Cookie("remember",userid);
			rememberCookie.setMaxAge(0);
			response.addCookie(rememberCookie);
		}
		response.sendRedirect("loginSuccess.jsp");
	}

//	3. 아이디와 비밀번호가 같지 않으면 다시 로그인 페이지로!
	 else {
			response.sendRedirect("loginForm.jsp");
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 여부</title>
</head>
<body>

로그인 성공

</body>
</html>