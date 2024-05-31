<%@page import="am.vo.MemVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="am.service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // 요청시 한글처리
	
	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");
	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
	String m_phone = request.getParameter("m_phone");
	
	Map<String, String> map = new HashMap<>();
	map.put("m_id", m_id);
	map.put("m_pw", m_pw);
	map.put("m_name", m_name);
	map.put("m_email", m_email);
	map.put("m_phone", m_phone);
	
	//맵퍼를 호출하기 위해 지정된 parameterType으로 만들어야 한다
	MemVO mvo = new MemVO();
	mvo.setM_id(m_id);
	mvo.setM_pw(m_pw);
	mvo.setM_name(m_name);
	mvo.setM_email(m_email);
	mvo.setM_phone(m_phone);
	
	//DB에 저장
	SqlSession ss = FactoryService.getFactory().openSession();
	
	int cnt = ss.insert("member.add", mvo);
	
	if(cnt>0){
		ss.commit();
%>
	<span>저장완료!</span>
<%
	}else{
		ss.rollback();
%>
	<span>저장실패!</span>
<%
	}
	ss.close();
%>