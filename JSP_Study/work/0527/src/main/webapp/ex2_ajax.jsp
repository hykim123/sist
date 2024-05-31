<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//count 인자 받기
	String cnt = request.getParameter("count");
	int count = 0;
	if(cnt != null){
		count = Integer.parseInt(cnt);
	}
	for(int i=0; i<count; i++){
%>
	<tr>
		<td><%=i+1 %></td>
		<td>항목<%=i+1 %></td>
		<td>&nbsp;</td>
	</tr>
<% 	
	}//for문의 끝
%>