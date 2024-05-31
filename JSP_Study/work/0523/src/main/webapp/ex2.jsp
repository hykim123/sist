<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  HTML 주석 // 페이지 원본보기하면 이건 보이는데 JSP 주석은 안보임 -->
<%-- JSP 주석
		JSP 기본 문법: 스크립트요소 3가지
						- 선언문: <%! 멤버변수, 멤버상수, 멤버메서드 %>
						- 스크립트릿: <% 자바문법(지역변수선언, 제어문, 연산식 등) %> : 릿 = 조각이라는 뜻
						- 출력문: <%= 변수명 또는 연산식 %>
 --%>
 <%!
 	// 선언부(멤버들 멤버변수, 상수, 메서드 정의)
 	int cnt = 10;
 	String str = "고래와 나";
 	
 	//cnt값을 반환하는 기능(메서드)
 	public int getCnt(){
 		return cnt;
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! 
		//선언부
		final String msg = "대한민국"; //상수
	%>
	<div id="wrap">
		<header>
			<h1>JSP연습</h1>
		</header>
		<article>
			<ol>
				<%
					for(int i=0; i<cnt; i++){
				%>
				<li><%=str %></li>
				<%} //for의 끝 %>
			</ol>
		</article>
	</div>

</body>
</html>