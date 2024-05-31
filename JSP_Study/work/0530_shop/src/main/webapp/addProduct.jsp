<%@page import="shop.bean.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session"/>
		<jsp:useBean id="cart" class="shop.bean.Cart" scope="session"/>
<%
		cart.addProduct(sb,sb.getP_num());
		response.sendRedirect("product_content.jsp?"+sb.getP_num());
	%>
</body>
</html>
