<%@page import="am.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@page import="am.service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//전달되어 오는 파라미터(s_type, s_value)들 받기
	String s_type = request.getParameter("s_type");
	String s_value = request.getParameter("s_value");
	
	//유효성 검사...(생략)
	Map<String, String> map = new HashMap<>();
	map.put("searchType", s_type);
	map.put("searchValue", s_value);
	
	//위에서 준비한 map을 emp.search라는 맵퍼를 호출할 때
	//인자로 넣어줘야 한다.
	SqlSession ss = FactoryService.getFactory().openSession();
	List<EmpVO> list = ss.selectList("emp.search",map);
	
	int i = 0;
	for(EmpVO vo : list){
%>
	<tr>
		<td><%=++i %></td>
		<td><%=vo.getEmpno() %></td>
		<td><%=vo.getEname() %></td>
		<td><%=vo.getJob() %></td>
		<td><%=vo.getHiredate() %></td>
		<td><%=vo.getDeptno()%></td>
	</tr>
<%
	}//for문의 끝
	ss.close();
%>