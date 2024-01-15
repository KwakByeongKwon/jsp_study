<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*, java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	BoardDao dao = new BoardDao();
	List<BoardVo> ls = dao.selectAll();
	pageContext.setAttribute("ls",ls);
	
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>

<%@ include file="header.jsp" %>
		<title>게시판</title>
	</head>
	<body>
	<br>
		<div class="container text-center" style="font-size:23px">
		    <div class="d-flex justify-content-between align-items-center">
		    	<h2>	</h2>
		        <h2>게시판</h2>
		        <a href="${pageContext.request.contextPath}/board/registForm.jsp">
		            <button class="btn btn-light">글등록</button>
		        </a>
		    </div>
			<table class="table table-striped">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th colspan="2">기타</th>
				</tr>
				<%
					for(int i = 0; i < ls.size(); i++){
				%>
						<tr>
							<td><%= ls.get(i).getNum() %></td>
							<td>
								<a href="${pageContext.request.contextPath}/board/boardDetail.jsp?num=<%= ls.get(i).getNum() %>"><%= ls.get(i).getTitle() %></a>
								<span class="badge bg-primary rounded-pill"><%= ls.get(i).getCnt() %></span>			
							</td>
							<td><%= ls.get(i).getWriter() %></td>
							<td><%= ls.get(i).getFormattedRegdate().substring(0,11)
									+ "| "
									+ ls.get(i).getFormattedRegdate().substring(11,13)
									+ "시 "
									+ ls.get(i).getFormattedRegdate().substring(14,16)
									+ "분"
								%>
							
							</td>
							<td><a href="${pageContext.request.contextPath}/board/editForm.jsp?num=<%= ls.get(i).getNum() %>" class="btn btn-primary">수정</a></td>
							<td><a href="${pageContext.request.contextPath}/board/deleteForm.jsp?num=<%= ls.get(i).getNum() %>" class="btn btn-danger">삭제</a></td>
						</tr>				
				<%
					}
				%>
			</table>
		</div>
	</body>
</html>