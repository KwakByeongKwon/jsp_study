<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="header.jsp" %>
<title>글등록</title>
</head>
<body>
<br>
<form action="regist.jsp" method="post">
<div class="container text-center" style="width:500px" >
	<div class="card border-dark mb-3" style="max-width: 50rem;">
		<h1>글등록</h1>
		<div class="card-body">	
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">제목</span>
			  <input type="text" class="form-control" name="title" placeholder="제목" aria-label="제목" aria-describedby="basic-addon1" required>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">작성자</span>
			  <input type="text" class="form-control" name="writer" placeholder="작성자" aria-label="작성자" aria-describedby="basic-addon1" required>
			</div>
			<div class="input-group">
			  <span class="input-group-text">내용</span>
			  <textarea class="form-control" name="content" aria-label="내용" placeholder="내용"></textarea>
			</div>
			<div class="card-footer">
				<input type="submit" value="등록" class="btn btn-success">
			</div>
		</div>
	</div>
</div>
</form>
</body>
</html>