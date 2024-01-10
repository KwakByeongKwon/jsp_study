<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% 
/* 
	위 처럼 나누어 작성하거나 한번에 합쳐서 생성도 가능합니다.
 ex)
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	 session="true" import="java.util.Date, java.text.SimpleDateFormat" % >
*/

	SimpleDateFormat formatter =
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	Date creationTime = new Date();
	creationTime.setTime(session.getCreationTime()); // 세션이 생성된 시간
	
	Date lastAccessedTime = new Date();
	lastAccessedTime.setTime(session.getLastAccessedTime()); // 마지막 접근 시간
%>

    <%
    // 세션은 자동적으로 만들어지고 페이지를 생성할때 session="false" 로 해주면 생성이 안됩니다.
    // session="true" 를 추가해주지 않아도 기본값으로 session="true"가 들어가있습니다.
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
세션에 저장된 데이터: <%= session.getAttribute("saveData") %><br> 
</body>
</html>