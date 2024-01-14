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
<title>${vo.title} 수정</title>
</head>
<body>	
<form action="edit.jsp" method="post">
	<table border="1">
		<tr>
			<th>제목:</th>
			<td>
				<input type="text" name="title" value="${vo.title}" placeholder="제목" required>
			</td>
		</tr>
		<tr>
			<th>작성자:</th>
			<td>
				<input type="text" name="writer" value="${vo.writer}" placeholder="작성자" required>
			</td>
		</tr>
		<tr>	
			<th>내용:</th>
			<td>
				<textarea rows="4" cols="20	" name="content" placeholder="내용">${vo.content}</textarea>
			</td>
		</tr>
	</table>
		<input type="submit" value="수정">
		<a href="list.jsp">취소</a>
</form>
</body>
</html>