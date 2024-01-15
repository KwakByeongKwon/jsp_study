<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="dao" class="board.BoardDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 확인</title>
</head>
<body>
<table border="1">	
	<tr>
		<th>정말 삭제 하시겠습니까? &nbsp
			<form action="delete.jsp?num=<%= num %>">
				<input type="hidden" name="num" value="<%= num %>" />
				<input type="submit" value="예">
			</form>
			<form action="list.jsp">
				<input type="submit" value="목록으로">
			</form>
		</th>	
	</tr>
</table>
</body>
</html>
