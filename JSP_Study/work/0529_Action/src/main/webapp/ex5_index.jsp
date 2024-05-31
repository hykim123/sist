<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="ex5_add.jsp" method="post">
		<label>제목:</label>
		<input type="text" name="title"/><br/>
		
		<label>글쓴이:</label>
		<input type="text" name="writer"/><br/>
		
		<label>내용:</label>
		<input type="text" name="contents"/><br/>
		
		<button>보내기</button>
	</form>
</body>
</html>