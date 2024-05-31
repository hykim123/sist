<%@page import="mybatis.vo.MemVO"%>
<%@page import="pm.service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
	// 전달해오는 파라미터들 받기
	String mid = request.getParameter("m_id");
	String mpw = request.getParameter("m_pw");
	
	Map<String, String> map = new HashMap<>();
	map.put("mid", mid);
	map.put("mpw", mpw);
	
	SqlSession ss = FactoryService.getFactory().openSession();
	MemVO mvo = ss.selectOne("member.login", map);
	ss.close();
	
	//위의 mvo가 null이면 아이디 또는 비밀번호가 틀린경우
	String path = "ex2_login_after.jsp";
	if(mvo != null){
		session.setAttribute("mvo", mvo);
	}else{
		//로그인 실패한 페이지로 이동하기 위해 준비
		path = "ex2_login_fail.jsp";
	}
	
	//다른 페이지로 이동
	response.sendRedirect(path);
%>
<!-- FactoryService를 이용해서 session을 얻어내고 FactoryService는 config.xml이 연결되어있음 
	config.xml < member.xml < MemVO 연관
	
	FactoryService를 통해 ss를 얻어내고 mapper를 호출함
	ss를 통해 MemVO를 얻어내고 얻어낸 MemVO를 세션에 저장한다
	그리고 화면이동
	
-->
</body>
</html>