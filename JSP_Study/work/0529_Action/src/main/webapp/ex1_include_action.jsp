<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<div id="wrap">
		<jsp:include page="ex1_menu.jsp"/>
		<%--
			include액션요소는
			포함된 jsp문서의 코드가 들어온 것이 아니라
			컴파일된 결과(HTML)가 포함된다. 그래서 jsp안에 있던 변수나 함수등을 현재페이지에서 사용할 수 없다
		 --%>
		 
		 <h1><%--  <%=str %> 이건 오류다 --%></h1>
	</div>
</body>
</html>