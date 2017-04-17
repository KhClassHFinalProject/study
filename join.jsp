<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String autoJoin = "6x8s3";
%>
<body>
<section>
<article>
<h2>회원가입 페이지</h2>
<form name="join" action="">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>
			<input type="text" name="id" id="id" maxlength="12">
			<input type="button" value="중복확인" onclick="multiCheck()">
			<input type="hidden" name="idCheck" id="idCheck">
			</td>
		</tr>
		<tr>
			<td colspan="2"> 아이디 5~12자 영문, 숫자 가능, 특수문자 사용불가</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="pwd" id="pwd" maxlength="12"></td>
		</tr>
		<tr>
			<td colspan="2"> 비밀번호 영문+숫자 포함 최대 12자</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="text" name="pwdCheck" id="pwdCheck" maxlength="12" onkeyup="pwdChecked()">
			<span id="pwd2"></span>
			</td>
		</tr>
		<tr>
			<th>이름
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>휴대폰 전화번호</th>
			<td>
			<select name="tel1" size="1">
				<option value="010" selected>010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select> - 
			<input type="text" name="tel2" size="5" maxlength="4"> - 
			<input type="text" name="tel3" size="5" maxlength="4">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="addr1"> - 
			<input type="text" name="addr2"></td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td><input type="text" name="mail1" maxlength="12"> @ 
			<input type="text" name="mail2" id="mail2">
			<select name="mailSelect" size="1" onChange="mailSelect1(this.value)">
				<option value="" selected>직접입력</option>
				<option value="naver.com">네이버</option>
				<option value="daum.net">다음</option>
				<option value="google.com">구글</option>
				<option value="nate.com">네이트</option>
			</select>
		</tr>
		<tr>
			<td colspan="2"><img src="/finalTeam/img/id.png" alt="방지"></td>
		</tr>
		<tr>
			<th>자동가입방지확인</th>
			<td><input type="text" name="textCheck" id="textCheck">
			<input type="button" value="난 정말 로봇이 아니라구요" onclick="autoCheck()"></td>
		</tr>
	</table>
	<input type="button" value="회원가입" onclick="joinClick()">
	<input type="reset" value="다시작성">
</form>
<div id="joinData"></div>
</article>
</section>
<script>
function joinClick(){
	if(document.getElementById("id").value==""){
		alert('아이디를 입력해주세요.');
	}else if(document.getElementById("idCheck").value==""){
		alert('중복검사를 해주세요');
	}else if(document.getElementById("idCheck").value != document.getElementById("id").value){
		alert('다시 입력한 아이디를 중복검사 해주세요.');
	}else if(document.getElementById("pwd").value==""){
		alert('비밀번호를 입력해 주세요!')
	}else if(document.getElementById("pwd").value != document.getElementById("pwdCheck").value){
		alert('비밀번호를 확인해 주세요!')
	}else if(document.getElementById("textCheck").value != "<%=autoJoin%>"){
		alert('자동가입방지 문자를 확인해주세요!')
	}else{
		alert('가입 승인!');
		document.getElementById("joinData").innerHTML=
			"아이디 : "+document.getElementById("id").value
			"\n비밀번호 : "+document.getElementById("pwd").value
			
		
	}
	
	console.log(document.getElementById("id").value);
	console.log(document.getElementById("idCheck").value);
}
function mailSelect1(mail){
	document.getElementById("mail2").value = mail;
}
function multiCheck(){
	var sid = document.getElementById("id").value;
	if(sid==""){
		window.alert('입력된 아이디가 없습니다');
	}else{
		window.open("idCheck.jsp?id="+sid+"","idCheck","width=400, height=200");
	}
}
function pwdChecked(){
	var spwd = document.getElementById("pwd").value;
	
	if(spwd==document.getElementById("pwdCheck").value){
		document.getElementById("pwd2").innerText="일치!";
	}else{
		document.getElementById("pwd2").textContent="불일치!";
	}
}
function autoCheck(){
	var stext = document.getElementById("textCheck").value;

	if(stext=="<%=autoJoin%>"){
		alert('정말 로봇이 아니군요!');
	}else{
		alert('로봇이군요 다시하세요!');
	}
}
</script>
</body>
</html>