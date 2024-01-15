<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="dao" class="board.BoardDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardVo vo = dao.selectOne(num);
	pageContext.setAttribute("vo", vo);
	dao.updateCnt(num);
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
<a href="${pageContext.request.contextPath}/board/editForm.jsp?num=${vo.num}"><button>수정</button></a>
<a href="${pageContext.request.contextPath}/board/deleteForm.jsp?num=${vo.num}"><button>삭제</button></a>
<br>
<a href="list.jsp"><button>목록으로</button></a>
</body>
</html>