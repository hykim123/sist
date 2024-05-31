<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<style>
.btn {
	width: 70px;
	height: 20px;
	text-align: center;
	padding: 0px;
}

.btn a {
	display: block;
	width: 100%;
	height: 20px;
	padding: 4px;
	line-height: 20px;
	background: #27a;
	color: #fff;
	border-radius: 3px;
	text-decoration: none;
	font-weight: bold;
	font-size: 12px;
}

.btn a:hover {
	background: #fff;
	color: #27a;
	border: 1px solid #27a;
}

div#wrap {
	width: 400px;
	margin: 30px auto;
}

table th, table td {
	padding: 3px;
}

table tbody td>input {
	width: 120px;
	border: 1px solid #27a;
	padding: 4px;
}

.phone {
	width: 50px;
}

.txt_R {
	text-align: right;
}

.success {
	color: #00f;
	font-weight: bold;
	font-size: 11px;
}

.fail {
	color: #f00;
	font-weight: bold;
	font-size: 11px;
}

div#box {
	display: inline-block;
	width: 65px;
	height: 20px;
	padding: 0;
	margin: 0;
	margin-left: 3px;
}

div#my_win {
	display: none;
}
</style>
</head>
<body>
	<div id="wrap">
		<form action="" method="post">
			<table>
				<colgroup>
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th class="txt_R"><label for="s_id">ID:</label></th>
						<td><input type="text" id="s_id" name="id" />
							<div id="box"></div></td>
					</tr>
					<tr>
						<th class="txt_R"><label for="s_pw">PW:</label></th>
						<td><input type="password" id="s_pw" name="pw" /></td>
					</tr>
					<tr>
						<th class="txt_R"><label for="s_name">NAME:</label></th>
						<td><input type="text" id="s_name" name="name" /></td>
					</tr>
					<tr>
						<th class="txt_R"><label for="s_email">EMAIL:</label></th>
						<td><input type="text" id="s_email" name="email" /></td>
					</tr>
					<tr>
						<th class="txt_R"><label for="s_phone">PHONE:</label></th>
						<td><input type="text" id="s_phone" name="phone"
							class="phone" /> - <input type="text" name="phone" class="phone" />
							- <input type="text" name="phone" class="phone" /></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<p class="btn">
								<a href="javascript: reg()">등록</a>
							</p>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>

	<div id="my_win" title="결과">asdf</div>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
	<script>
	$(function(){
		//현재문서에서 아이디가 s_id인 요소에 키보드가 누를 때마다 수행하는 함수를 이벤트로 적용하자
		$("#s_id").bind("keyup",function(){
			// 아이디가 s_id요소의 값을 가져와서 변수 str에 저장
			let str = $("#s_id").val().trim();
			//console.log(str);
			
			//str의 문자열의 길이가 4자 이상일 때만 서버와 통신하자!
			if(str.length > 3){
				$.ajax({
					url: "check_id.jsp",
					type: "post",
					data: "m_id="+encodeURIComponent(str),
				}).done(function(res){
					//성공적으로 수행이 끝났을 때
					$("#box").html(res);
				});
			}
		});
		
	});
	
	function reg(){
		//console.log($("#box").find("span.success").length > 0);
		if($("#box").find("span.success").length > 0){
			let mid = document.getElementById("s_id");
			let mpw = document.getElementById("s_pw");
			let mname = document.getElementById("s_name");
			let email = document.getElementById("s_email");
			let ar = document.getElementsByName("phone");
			
			let param = "m_id="+encodeURIComponent(mid.value)+
						"&m_pw="+encodeURIComponent(mpw.value)+
						"&m_name="+encodeURIComponent(mname.value)+
						"&m_email="+encodeURIComponent(email.value)+
						"&m_phone="+encodeURIComponent(ar[0].value + ar[1].value + ar[2].value);
			
			$.ajax({
				url: "addMember.jsp",
				type: "post",
				data: param,
			}).done(function(data){
				console.log(data);
				$("#my_win").html(data.trim());
				$("#my_win").dialog();
			});
		}//if의끝
	}
</script>

</body>
</html>
