<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 입력 폼</title>
</head>
<body>
폼에 데이터 입력 후 전송버튼 클릭.<br>
<form action="ex04-result.jsp" method="post">
<input type="text" name="name" placeholder="이름"><br>
<input type="text" name="address" placeholder="주소"><br>
좋아하는 동물<br>
<input type="checkbox" value="dog" id="dog" name="animal">
<label for="dog">강아지</label><br>
<input type="checkbox" value="cat" id="cat" name="animal">
<label for="cat">고양이</label><br>
<input type="checkbox" value="shark" id="shark" name="animal">
<label for="shark">상어</label><br>
<input type="submit" value="전송">
</form>

</body>
</html>