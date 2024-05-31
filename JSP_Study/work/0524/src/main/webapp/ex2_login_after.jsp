<%@page import="mybatis.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.name{
		font-weight: bold;
		color: #00bfff;
	}
</style>
</head>
<body>
<%
	Object obj = session.getAttribute("mvo");
	
	if(obj != null){
		MemVO mvo = (MemVO)obj;
		String name = mvo.getM_name();
%>
	<h2><span class="name"><%=name %></span> 님 환영합니다.</h2>
	<button type="button" onclick="javascript:location.href='ex2_logout.jsp'">로그아웃</button>
<%
	}else{ //obj가 null인경우
%>
	<h2>잘 못 된 정보입니다.</h2>
	<button type="button" onclick="login()">로그인</button>
<%
	}
%>
<script>
	function login(){
		location.href="ex2_login.jsp";
	}
</script>
</body>
</html>