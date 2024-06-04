<%@page import="mybatis.vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사원 목록</h1>
	<hr/>
	<ol>
<%
	Object obj = request.getAttribute("list");
	if(obj != null){
		EmpVO[] ar = (EmpVO[])obj;
		
		for(EmpVO evo : ar){
			
%>
		<li><%=evo.getEmpno() %>,<%=evo.getEname() %>,<%=evo.getJob() %></li>
<% 
		}//for의 끝
	}	//if문의 끝
	
%>
	</ol>
</body>
</html>