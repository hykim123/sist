<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- HttpSession은 HttpServletRequest와 마찬가지로 JSP에서는 내장객체이다 --%>
<%
	String name = "마루치";
	
	//세션에 객체 저장가능. 세션에 저장하자 > jsp는 이미 HttpSession을 갖고있음
	session.setAttribute("u_name", name);
	//세션에 "u_name"이라는 명칭으로 name이 기억하고있는 "마루치"를 저장한 상태
	// 세션은 내가 끊기전까지 언제든지 불러서 사용가능
%>	
		[<a href="ex1_session1.jsp">다음페이지</a>]  <!-- 이건 sendRedirect로 가는것임 -->
</body>
</html>