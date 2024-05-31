<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<div id="wrap">
		<%@ include file="ex1_menu.jsp" %>
		<%--
			include 지시자는 포함된 jsp문서의 코드 자체를 포함시켜 한번에 컴파일을 수행한다.
			그러므로 ex1_menu.jsp에 있는 변수를 현재 페이지에서 사용할 수 있다.
		 --%>
		 <h1><%=str %></h1>
	</div>
</body>
</html>