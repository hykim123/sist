<%@page import="mybatis.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<div id="wrap">
		<header>
			<jsp:include page="menu.jsp"/>
		</header>
			<article>
				<jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session"/>
				<jsp:setProperty property="*" name="sb"/>
				<%-- 이때 현재 페이지로 전달되는 파라미터 category가 ShopBean안에 있는 멤버변수인 category에 자동 저장됐다 --%>
				<%
					sb.searchProduct(); // 사용자가 선택한 category별 제품들이 모두 ShopBean안에 p_list라는 멤버변수에 저장된 상태다
					//ShopBean이 가지고 있는 검색된 결과 즉, 배열을 얻어낸다.
					ProductVO[] ar = sb.getP_list();
				%>
				<table class="table">
					<caption>제품목록 테이블</caption>
					<colgroup>
						<col width="90px"/>
						<col width="110px"/>
						<col width="*"/>
						<col width="120px"/>
						<col width="120px"/>
					</colgroup>
					<thead>
						<tr bgcolor="#dedede">
							<th>제품번호</th>
							<th>이미지</th>
							<th>제품명</th>
							<th>제품가격</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<%if(ar != null){
								for(ProductVO vo :ar){
						%>
								<tr align="center">
									<td><%=vo.getP_num() %></td>
									<td>
										<img src="images/<%=vo.getP_image_s()%>"/>
									</td>
									<td><a href="product_content.jsp?p_num=<%=vo.getP_num()%>"><%=vo.getP_name() %></a></td>
									<td>할인가:<%=vo.getP_saleprice() %>원<br/>
										<pre class="red_txt">(<%=vo.getPercent()%>%)</pre>
									</td>
									<td>
										정상가:<%=vo.getP_price() %>
									</td>
								</tr>
						<%
								}//for문의 끝
							}//if문의 끝%>
					</tbody>
				</table>
			</article>
	</div>
</body>
</html>