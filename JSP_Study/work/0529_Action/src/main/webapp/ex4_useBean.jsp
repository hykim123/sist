<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");



%>

	<jsp:useBean id="vo" class="pm.vo.DataVO" scope="page"/>
	<jsp:setProperty name="vo" property="*"/>
	<!--<jsp:setProperty name="vo" property="mid" param="mid"/> --> 
	<!-- setProperty: setter부르겠다 vo의 mid를 파라미터들 중 mid를 찾아서 vo객체가 갖고있는 mid에 넣겠다
		이때 property와 param의 이름이 같으면 param 생략가능 -->
																
	<!-- DataVO vo = new DataVO();
		 String mid = request.getParameter(mid);
		 vo.setMid(mid); -->

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%= vo.getMid() %></h2>
	<h2><%= vo.getMpw() %></h2>
	<h2><%= vo.getMname() %></h2>
</body>
</html>