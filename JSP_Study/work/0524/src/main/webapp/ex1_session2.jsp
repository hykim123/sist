<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//세션으로부터 "u_name"이라는 명칭으로 저장된 값을 삭제하자!
	session.removeAttribute("u_name");

	// 별도로 전달되는 name이라는 파라미터 받기
	String name = request.getParameter("name"); //request 는 내장객체
%>
	<!-- 여기 name은 세션 이름이아닌 파라미터로 넘긴 값을 받아온것임 -->
	<h2><%= name %>님 안녕히 가세요</h2>
	<a href="ex1_session3.jsp">다음페이지</a>
</body>
</html>