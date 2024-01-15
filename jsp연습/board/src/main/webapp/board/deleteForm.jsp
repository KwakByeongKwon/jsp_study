<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="dao" class="board.BoardDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
%>
<%@ include file="header.jsp" %>
<title>삭제 확인</title>
</head>
<body>
<br>
<div class="container text-center" style="width:500px" >
	<div class="card border-dark mb-3" style="max-width: 50rem;">
		<h1>정말 삭제 하시겠습니까?</h1>
		<div class="card-body">	
			<div class="d-flex justify-content-between align-items-center">
				<a href="delete.jsp?num=<%= num %>" class="btn btn-danger">예</a>
				<a href="list.jsp" class="btn btn-primary">목록으로</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>