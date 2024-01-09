<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 헤더 정보</title>
</head>
<body>
<%
	Enumeration enumData = request.getHeaderNames();
	while(enumData.hasMoreElements()){
		String headerName = (String)enumData.nextElement();
		String headerValue = request.getHeader(headerName);
		System.out.println(headerName + ":" + headerValue);
	}
%>

</body>
</html>