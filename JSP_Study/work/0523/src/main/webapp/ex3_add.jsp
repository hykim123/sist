<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table caption{ text-indent: -9999px; }
</style>
</head>
<body>
	<div id="wrap">
		<header>
			<h1>부서추가</h1>
		</header>
		<article>
			<form action="ex3_add_ok.jsp" method="post">
				<table>
					<caption>부서추가테이블</caption>
					<colgroup>
						<col width="80px"/>
						<col width="*"/>
					</colgroup>
					<tbody>
						<tr>
							<td><label for="deptno">부서코드</label></td>
							<td><input type="text" name="deptno"/></td>
						</tr>
						<tr>
							<td><label for="dname">부서명</label></td>
							<td><input type="text" name="dname"/></td>
						</tr>
						<tr>
							<td><label for="loc">도시코드</label></td>
							<td><input type="text" name="loc"/>
							<input type="hidden" id="ip" name="ip" value="<%=request.getRemoteAddr() %>"/>
							<!--  원격 주소를 달라고함 - 반환형 문자열 : 요청한사람의 IP 주소-->
							<!-- 이 값도 전달하고싶으면 input으로 만들어서 form으로 전송해야함! -->
							<!-- disabled 서버로 전달 불가 readonly 또는 hidden-->
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" onclick="exe()">보내기</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</article>
	</div>
<script>
	function exe(){
		//유효성 검사 생략
		document.forms[0].submit();
	}
</script>
</body>
</html>