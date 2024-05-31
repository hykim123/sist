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
	//세션의 getAttribute메서드는 세션에 저장시 어떤 객체를 저장했는지 몰라서 최상위 객체인 Object를 반환한다.
	//그래서 저장시 자료형으로 형변환을 해야 원하는 작업을 할 수 있다.
	//개발자는 저장할 때 어떤 자료형으로 저장했는지 알고있다
	
	Object obj = session.getAttribute("u_name");
	//String name = (String)session.getAttribute("u_name"); // 이렇게 쓰면 오류는 안나는것처럼 보이지만 null값일 때 오류가 뜬다
	//따라서 obj가 null이 아닐때만 형변환 하자!
	if(obj != null){
		String name = (String)(obj);
%>
	<%= name %> 님 환영합니다.<br/>
	<button type="button" onclick="logout('<%=name%>')">로그아웃</button>
<%
	}
	
%>
<script>
	function logout(n){
		//로그아웃을 하는 페이지로 이동을 할 것임
		location.href="ex1_session2.jsp?name="+n;
	}
</script>
</body>
</html>