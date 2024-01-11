<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="dao" class="board.BoardDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardVo vo = dao.selectOne(num);
	pageContext.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.title}</title>
</head>
<body>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<tr>
		<td>${vo.num}</td>
		<td>${vo.title}</td>
		<td>${vo.writer}</td>
		<td>${vo.regdate}</td>
		<td>${vo.cnt}</td>
	</tr>
	<tr>
		<th colspan="5">내용</th>
	</tr>	
	<tr>
		<td colspan="5">${vo.content}</td>
	</tr>
	
</table>
</body>
</html>