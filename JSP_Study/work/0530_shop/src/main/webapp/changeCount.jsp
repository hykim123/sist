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
		String count = request.getParameter("count");
		
		if(count != null && p_num != null){
			int q = Integer.parseInt(count);
			if(q < 1)
				cart.delProduct(p_num);
			else
			cart.changeCount(p_num, q);
		}
		response.sendRedirect("cartList.jsp");
	%>
</body>
</html>