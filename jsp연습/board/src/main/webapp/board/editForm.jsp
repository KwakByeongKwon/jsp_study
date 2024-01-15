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

<%@ include file="header.jsp" %>
<title>${vo.title} 수정</title>
</head>
<body>
<br>
<form action="edit.jsp" method="post">
<input type="hidden" name="num" value="${vo.num}">
<div class="container text-center" style="width:500px" >
	<div class="card border-dark mb-3" style="max-width: 50rem;">
		<h1>수정</h1>
		<div class="card-body">	
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">제목</span>
			  <input type="text" class="form-control" value="${vo.title}" name="title" placeholder="제목" aria-label="제목" aria-describedby="basic-addon1" required>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">작성자</span>
			  <input type="text" class="form-control" value="${vo.writer}" name="writer" placeholder="작성자" aria-label="작성자" aria-describedby="basic-addon1" required>
			</div>
			<div class="input-group">
			  <span class="input-group-text">내용</span>
			  <textarea class="form-control" name="content" aria-label="내용" placeholder="내용">${vo.content}</textarea>
			</div>
			<div class="card-footer">
				<input type="submit" value="수정" class="btn btn-success">
			</div>
		</div>
	</div>
</div>
</form>
</body>
</html>

