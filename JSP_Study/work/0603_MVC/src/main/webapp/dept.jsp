<%@page import="mybatis.vo.DeptVO"%>
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
			<h1>부서 목록</h1>
		</header>
		<article>
			<table id="table">
				<caption>부서목록 테이블</caption>
				<thead>
					<tr>
						<th>부서번호</th>
						<th>부서명</th>
						<th>지역코드</th>
					</tr>
				</thead>
				<tbody>
<%
	Object obj = request.getAttribute("dept");
	if(obj != null){
		DeptVO[] ar = (DeptVO[])obj;
		
		for(DeptVO evo : ar){
			
%>
		<tr>
			<td><%=evo.getDeptno() %></td>
			<td><%=evo.getDname() %></td>
			<td><%=evo.getLoc_code() %></td>
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