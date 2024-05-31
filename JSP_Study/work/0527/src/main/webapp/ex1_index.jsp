<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#box{
		width: 400px;
		height: 200px;
		border: 1px solid black;
	}
</style>
</head>
<body>
	<button type="button" id="btn">비동기적 통신</button>
	<br/>
	<div id="box">
		
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
	$(function(){
		//아이디가 btn인 버튼에게 클릭이벤트 부여하기
		$("#btn").bind("click", function(){
			//버튼을 클릭할 때마다 수행하는 곳
			
			//서버에 비동기식 통신을 보낸다.
			$.ajax({
				url: "ex1_ajax.jsp", //호출하고자 하는 url 경로
				type:"get", // 요청 타입
				data: "name=michael" //인자전달
			}).done(function(data){ //서버로부터 전달되어오는 결과를 인자로 받는다. 이름 마음대로 
				$("#box").html(data);
			});
		});
	})
</script>
</body>
</html>