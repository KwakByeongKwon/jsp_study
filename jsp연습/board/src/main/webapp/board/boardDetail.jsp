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
<%@ include file="header.jsp" %>

<title>${vo.title}</title>
</head>
	<body>
		<br>
		<div class="container text-center" style="font-size:23px; width:700px;">
			<table class="table table-striped">
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
					<td>
					<%= vo.getFormattedRegdate().substring(0,11)
						+ "| "
						+ vo.getFormattedRegdate().substring(11,13)
						+ "시 "
						+ vo.getFormattedRegdate().substring(14,16)
						+ "분"
					%>
					</td>
					<td>${vo.cnt}</td>
				</tr>
				<tr>
					<th colspan="5">내용</th>
				</tr>	
				<tr>
					<td colspan="5" style="width:700px; height:300px">${vo.content}</td>
				</tr>
			</table>
			<div class="d-flex justify-content-between align-items-center">
				<a href="${pageContext.request.contextPath}/board/editForm.jsp?num=${vo.num}" class="btn btn-primary">수정</a>
				<a href="list.jsp" class="btn btn-primary">목록으로</a>
				<a href="${pageContext.request.contextPath}/board/deleteForm.jsp?num=${vo.num}" class="btn btn-danger">삭제</a>
			</div>
		</div>
	</body>
</html>