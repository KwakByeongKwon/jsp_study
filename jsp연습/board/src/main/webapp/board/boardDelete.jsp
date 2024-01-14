<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="Vo" class="board.BoardVo"/>
<jsp:useBean id="dao" class="board.BoardDao"/>
<jsp:setProperty name="Vo" property="*"/>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardVo vo = dao.selectOne(num);
	pageContext.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.title} 삭제</title>
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
	<tr>
		<th colspan="5">정말 삭제 하시겠습니까? &nbsp
			<form action="${pageContext.request.contextPath}/board/list.jsp">
				<button>예</button>
				<%
					dao.insert(vo);
				%>
			</form>
		</th>
	</tr>
</table>
</body>
</html>