<%@page import="mybatis.vo.BookVO"%>
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
			<h1>책 목록</h1>
		</header>
		<article>
			<table id="table">
				<caption>책목록 테이블</caption>
				<thead>
					<tr>
						<th>제목</th>
						<th>저자</th>
						<th>작성일</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
<%
	Object obj = request.getAttribute("book");
	if(obj != null){
		BookVO[] ar = (BookVO[])obj;
		
		for(BookVO evo : ar){
			
%>
		<tr>
			<td><%=evo.getSubject() %></td>
			<td><%=evo.getAuthor() %></td>
			<td><%=evo.getReg_date() %></td>
			<td><%=evo.getPrice() %></td>
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