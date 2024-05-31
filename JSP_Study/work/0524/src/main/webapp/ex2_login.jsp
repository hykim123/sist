<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<header>
			<h1>로그인</h1>
		</header>
		<article>
			<form action="ex2_login_ok.jsp" method="post">
				<table>
					<caption>로그인 테이블</caption>
					<colgroup>
						<col width="90px"/>
						<col width="*"/>
					</colgroup>
					<tbody>
						<tr>
							<td>
								<label for="s_id">아이디:</label>
							</td>
							<td>
								<input type="text" id="s_id" name="m_id" placeholder="사용자 아이디 입력..."/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="s_pw">비밀번호:</label>
							</td>
							<td>
								<input type="password" id="s_pw" name="m_pw" placeholder="사용자 비밀번호 입력..."/>
							</td>
						</tr>
						<tr>
							<td cols="2">
								<button type="button" onclick="login(this.form)">로그인</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</article>
	</div>
	<script>
		function login(frm){ //인자로 버튼이 포함된 폼 객체가 들어옴
			//유효성 검사
			let id = frm.m_id.value; // 이름으로 접근
			let pw = frm.m_pw.value; // 이름으로 접근
			
			if(id.trim().length < 1){
				//사실 공백제거는 정규표현식에 의해 제거하는 것이 바람직 하다
				alert("아이디를 입력하세요");
				frm.m_id.value = "";
				frm.m_id.focus();
				return;
			}
			
			if(pw.trim().length < 1){
				//사실 공백제거는 정규표현식에 의해 제거하는 것이 바람직 하다
				alert("비밀번호를 입력하세요");
				frm.m_pw.value = "";
				frm.m_pw.focus();
				return;
			}
			//document.forms[0].submit();
			frm.submit(); //서버로보내기
			
		}
	</script>
</body>
</html>