<%@page import="java.io.File"%>
<%@page import="mybatis.vo.MemVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="mybatis.service.FactoryService"%>
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
		
		//회원가입에 성공한 회원의 아이디로 된 폴더를 
		//members 라는 폴더에 만들어야 한다.
		String path = application.getRealPath("/members/"+mvo.getM_id());  //절대경로
		//System.out.println(path);
		
		//앞서 절대경로를 가지고 File객체를 생성한다.
		File f = new File(path);
		
		//가상으로 만든 File 객체가 실제 존재하지 않을 때만
		// 물리적으로 폴더를 생성하자
		if(!f.exists()){	//존재하지 않을 때
			f.mkdir();	//실제 디렉토리가 생성된다
		}
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