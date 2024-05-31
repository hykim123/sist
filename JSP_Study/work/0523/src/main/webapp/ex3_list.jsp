<%@page import="pm.service.FactoryService"%>
<%@page import="am.vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="pm.service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
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
		//요청시 한글처리
		request.setCharacterEncoding("utf-8");
	
		SqlSession ss = FactoryService.getFactory().openSession();
		List<DeptVO> d_list = ss.selectList("dept.select");
		
	%>
		<ol>
	<%
		for(DeptVO dvo :d_list){
	%>
		<li>
			<%=dvo.getDeptno()%> / <%= dvo.getDname()%> / <%=dvo.getLoc_code() %> 
		</li>
	<%
		}
	%>
	</ol>
</body>
</html>