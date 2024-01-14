<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*, java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	BoardDao dao = new BoardDao();
	List<BoardVo> ls = dao.selectAll();
	pageContext.setAttribute("ls",ls);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<h2>게시글 목록</h2>
<table border="1">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>조회수</th>
	<th colspan="2">기타</th>
</tr>
<c:forEach var="board" items="${ls}">
<tr>
	<td>${board.getNum()}</td>
	<td><a href="${pageContext.request.contextPath}/board/boardDetail.jsp?num=${board.num}">${board.getTitle()}</a></td>
	<td>${board.getWriter()}</td>
	<td>${board.getRegdate()}</td>
	<td>${board.getCnt()}</td>
	<td><a href="${pageContext.request.contextPath}/board/boardDelete.jsp?num=${board.num}">삭제</a></td>
	<td><a href="${pageContext.request.contextPath}/board/editForm.jsp?num=${board.num}">수정</a></td>
</tr>
</c:forEach>
</table>
<a href="${pageContext.request.contextPath}/board/registForm.jsp" ><button>글등록</button></a>
</body>
</html>