<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function idcheck_ok() {

		window.open("idCheck.jsp", "idcheck",
				"width=500, height=250, scrollbars=no");
	}
	function emailCheck_ok() {

		window.open("email_Check.jsp", "idcheck",
				"width=400, height=400, scrollbars=no");
	}

	function keyCheck() {
		if (document.getElementById('pwdCheck').value == document.getElementById('password').value) {

			document.getElementById('chk').innerHTML = '<img src="img/o.png"> 사용 가능';
			//innerHTML로 화면에 출력
		} else {
			document.getElementById('chk').innerHTML = '<img src="img/x.png"> 사용 불가능';
		}
		//두개 입력란이 비교되는것은 가능하나..기능성은 안됌..
	}
</script>
<body>
	<section>
		<article>
			<form name="join" action="join_ok.jsp">
				<fieldset>
					<legend> 회원가입</legend>
					<ul>

						<li><label> ID</label> 
						<input type="text" name="id" readonly placeholder="특수 문자 , 한글사용 금지">
						 <input type="button" value="중복확인" onClick="idcheck_ok()"></li>

						<li><label> 패스워드</label> 
						<input type="password" name="password" id="password" required="required" placeholder="비밀번호"></li>
						<!-- required="required" 입력을 안하면 에러! -->

						<li><label> 패스워드 확인</label> 
						<input type="password" name="pwdCheck" id="pwdCheck" required="required" placeholder="비밀번호 확인" onkeyup="keyCheck()">
						<span id="chk"></span>
						</li>

						<li><label> Name</label>
						 <input type="text" name="name"	required="required" placeholder="ex) 홍길동">
						 </li>

						<li><label> E-mail</label> 
						<input type="text" name="email" placeholder="ex) abc@example.com" required="required" readonly>
						<input type="button" value="중복확인" onClick="emailCheck_ok()">
						</li>


						<li><label> Telephone</label> 
						<input type="text" name="tel" required="required" placeholder="ex) 01012345678"></li>

						<li><input type="checkbox" name="check" value="동의">	동의</li>
						<!-- submit 을 해주면 ok로 넘어가고 체크가 넘어가는지 확인 -->

					</ul>
					<p>
						<input type="submit" value="등록"> 
						<input type="reset" value="다시작성">
					</p>
				</fieldset>
			</form>
		</article>
	</section>
</body>
</html>
