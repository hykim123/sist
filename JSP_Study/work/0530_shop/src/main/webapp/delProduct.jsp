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
		
		String p_num = request.getParameter("p_num");
		if(p_num != null)
			cart.delProduct(p_num);
		response.sendRedirect("cartList.jsp");
	%>
</body>
</html>