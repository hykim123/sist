<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	//파라미터들 받기
	String name = request.getParameter("name"); //이름
	String year = request.getParameter("year"); //생년
	String age = request.getParameter("age"); //나이
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(name == null || year == null || age == null){
%>
	<form action="ex2_forward2.jsp" method="post">
		<label>이름:</label>
		<input type="text" id="name" name="name"/><br/>
		
		<label>생년:</label>
		<input type="text" id="year" name="year" placeholder="2000"/><br/>

		<input type="submit" value="보내기"/>		
	</form>
<%
	}else{
		//파라미터 3개를 모두 받은 경우
%>
		<h2>
			<%=name %>님은 <%=year %>년 생이므로 <br/>
			<%=age %>세 입니다.
		</h2>
<%
	}
%>
</body>
</html>