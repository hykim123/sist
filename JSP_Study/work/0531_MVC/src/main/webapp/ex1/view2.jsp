<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>페이지 two</h1>
	<%
		//request에 v1이라는 이름으로 저장된 값을 얻어낸다.
		Object obj = request.getAttribute("v1");
	
		//얻어낸 값이 null이 아닐 때
		if(obj != null){
			String msg = (String)obj;
	%>
		<h2><%=msg %></h2>
	<%
		}else{
			out.println("<h2>없습니다.</h2>");
		}
	%>
</body>
</html>