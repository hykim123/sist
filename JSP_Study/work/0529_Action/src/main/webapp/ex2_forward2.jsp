<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	//파라미터들 받기
	String name = request.getParameter("name"); //이름
	String year = request.getParameter("year"); //생년
	
	//파라미터 값들 중 하나라도 받지 못했다면 앞 페이지로 이동
	if(name == null || year == null){
		//response.sendRedirect("ex2_forward.jsp");
%>
		<jsp:forward page="ex2_forward.jsp"/>
<%
	}else{
		//나이 구하기
		//Date now = new Date(System.currentTimeMillis());
		//위는 년-월-일
		
		Calendar now = Calendar.getInstance();
		
		//현재년도 구하기
		int cYear = now.get(Calendar.YEAR);
		int cMonth = now.get(Calendar.MONTH)+1;
		int cDate = now.get(Calendar.DAY_OF_MONTH);
		
		//사용자가 입력해서 보내준 생년은 문자열이므로 연산을 못한다.
		//다시 정수로 변환해야 한다.
		int bYear = Integer.parseInt(year);
		
		//나이 구하기
		int age = cYear - bYear;
		
		//바로 앞 페이지로 forward시킨단
%>
		<jsp:forward page="ex2_forward.jsp">
			<jsp:param value="<%=age %>" name="age"/>
		</jsp:forward>
<%
	}
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