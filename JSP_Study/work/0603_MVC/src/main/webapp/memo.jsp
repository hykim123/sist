<%@page import="mybatis.vo.MemoVO"%>
<%@page import="mybatis.vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#table{
		width: 600px;
		border-collapse: collapse;
	}
	#table th, #table td{
		border: 1px solid #ccc;
		padding: 4px;
	}
	#table caption{
		text-indent: -9999px;
	}
</style>
</head>
<body>
	<div id="wrap">
		<header>
			<h1>메모 목록</h1>
		</header>
		<article>
			<table id="table">
				<caption>메모목록 테이블</caption>
				<thead>
					<tr>
						<th>내용</th>
						<th>작성자</th>
						<th>ip</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
<%
	Object obj = request.getAttribute("memo");
	if(obj != null){
		MemoVO[] ar = (MemoVO[])obj;
		
		for(MemoVO evo : ar){
			
%>
		<tr>
			<td><%=evo.getContent() %></td>
			<td><%=evo.getWriter() %></td>
			<td><%=evo.getIp() %></td>
			<td><%=evo.getWrite_date() %></td>
		</tr>
<% 
		}//for의 끝
	}	//if문의 끝
%>
	</tbody>
	</table>
	</article>
	</div>
	
</body>
</html>