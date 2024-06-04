<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul#menu{
		width: 80%;
		height: 30px;
		margin: 10px auto;
		padding: 0px;
		display: flex;
		list-style: none;
	}
	ul#menu>li{
		width: 160px;
		height: 100%;
		border: 1px solid blue;
		border-right: none;
	}
	ul#menu>li:first-child{
		border-left: none;
	}
	ul#menu>li>a{
		display: block;
		width: 100%;
		height: 100%;
		line-height: 30px;
		text-decoration: none;
		text-align: center;
		background-color: #00bfff;
		color: #fff;
	}
</style>
</head>
<body>
	<div id="wrap">
		<header>
			<ul id="menu">
				<li><a href="Controller?type=emp">사원목록</a></li>
				<li><a href="Controller?type=dept">부서목록</a></li>
				<li><a href="Controller?type=book">도서목록</a></li>
				<li><a href="Controller?type=memo">메모목록</a></li>
			</ul>
		</header>
	</div>
</body>
</html>