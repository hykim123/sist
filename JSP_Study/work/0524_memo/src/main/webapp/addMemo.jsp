<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="pm.service.FactoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		String ip = request.getRemoteAddr();
		
		Map<String, String> map = new HashMap<>();
		map.put("content",content);
		map.put("writer",writer);
		map.put("ip",ip);
	
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("memo.addMemo",map);
		if(cnt > 0){
			ss.commit();
		}else{
			ss.rollback();
		}
			ss.close();
			response.sendRedirect("memoList.jsp");
	%>
</body>
</html>