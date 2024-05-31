<%@page import="pm.service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.io.Resources"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	SqlSession ss = FactoryService.getFactory().openSession();
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="vo" class="pm.vo.DataVO" scope="page"/>
	<jsp:setProperty name="vo" property="*"/>
<%
	ss.insert("data.add",vo);
	ss.commit();
%>
	<h2><%= vo.getTitle() %></h2>
	<h2><%= vo.getWriter() %></h2>
	<h2><%= vo.getContents() %></h2>
</body>
</html>