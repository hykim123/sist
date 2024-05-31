<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.mysql.cj.Session"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%--
   		첨부된 파일을 받기 위해선 servlets.com 에있는 cos라이브러리가 필요하다
   		사이트 왼쪽 메뉴에 [COS File upload Library라는 메뉴를 선택한 후
   		화면 아래로 내려 다운 받는다 
    --%>
    
<%
	String dir = (String)session.getAttribute("dir");
	//String file = request.getParameter("upload");
	ServletRequest req = request;
	//첨부파일을 받아서 서버에 올리기 위해 필요한 객체를 생성한다.
	MultipartRequest mr = new MultipartRequest(req, "c:/my_study", 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>