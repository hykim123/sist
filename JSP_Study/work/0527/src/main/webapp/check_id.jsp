<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="am.vo.MemVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="am.service.FactoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // 요청시 한글처리

	String s_id = request.getParameter("m_id");
	SqlSession ss = FactoryService.getFactory().openSession();
	
	MemVO mvo = ss.selectOne("member.check_id", s_id);

	if(mvo == null){
%>		
	<span class="success">사용가능</span>
<%	
	}else{
%>
	<span class="fail">사용불가</span>
<%
	}
	ss.close();
%>