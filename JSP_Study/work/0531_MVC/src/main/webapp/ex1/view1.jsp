<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>페이지1</h1>
	<%--request에 v1이라는 이름으로 저장된 값을 출력한다 --%>
	<h2>${v1 }</h2>
	<button type="button" onclick="goNext()">다음</button>
	
	<script>
		//function goNext(){
		//let goNext = function(){
		let goNext = () => {
			location.href="ex1/view2.jsp"; // redirect로 이동
		}
	</script>
</body>
</html>