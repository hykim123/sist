<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="v1" class="pm.vo.Count" scope="page"/>
	<%--Count v1 = new Count() --%>
	<!-- scope: 얘가 사용 될 수 있는 사용 범위 / class를 저 id로 쓰겠다 -->
	
	<jsp:useBean id="v2" class="pm.vo.Count" scope="session"/>
	<jsp:useBean id="v3" class="pm.vo.Count" scope="application"/>
	
<%
	v1.inc();
	v2.inc();
	v3.inc();
%>
	<h1>ex3_useBean2.jsp</h1>
	<h2>v1.count - page : <%=v1.getCount() %></h2>
	<h2>v2.count - session : <%=v2.getCount() %></h2>
	<h2>v3.count - application : <%=v3.getCount() %></h2>
	
	<a href="ex3_useBean.jsp">[이전 페이지]</a>
</body>
</html>