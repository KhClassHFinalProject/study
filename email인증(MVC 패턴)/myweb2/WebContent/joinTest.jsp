<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//자동가입방지 문자생성기
var keylist='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789';
var temp='';

//문자 생성하기
function generatePass(){
 temp = '';
 for(i = 0; i<8;i++){
    temp+=keylist.charAt(Math.floor(Math.random()*keylist.length));
 }
 document.getElementById('output').value = temp;
}

function mykeydown(){
	var obj = document.getElementById("id1").value;
	
	check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	if(check.test(obj)){
		alert("한글"+obj+"이 있습니다.");
		document.getElementById("id1").value = null;
	}
}

function passCheck(){
	var pass = document.getElementById("pass").value;
	var passchk2 = document.getElementById("passchk2").value;
	if(pass==passchk2){
		document.getElementById("passSuc").value = "패스워드가 일치합니다.";
		document.getElementById("passchk").value ="일치";
	}else{
		document.getElementById("passSuc").value = "패스워드가 일치하지 않습니다.";
		document.getElementById("passchk").value = null;
	}
}

function emailInput(){
	if(document.getElementById("email2_1").value==1){
		document.getElementById("email2").value = null;
		document.getElementById("email2").readOnly = false;
	}else{
		document.getElementById("email2").readOnly = true;
		document.getElementById("email2").value = document.getElementById("email2_1").value
	}
}


function emailCheck(){
	var email = document.getElementById("email1").value + "@" + document.getElementById("email2").value;
	if(email==null || email=="@"){
		alert('이메일을 입력해주세요');
	}else{
		window.open('emailSend.yong?email='+email);
		alert('인증번호를 전송합니다');
	}
	
	
}

</script>
</head>

<body>
<h2>회 원 가 입</h2>
<form name="join" action="joinTest_ok.jsp">
    아이디 : 
    <input type="text" name="id" id="id1" placeholder="아이디를 입력해주세요." onkeyup='mykeydown()'>

    <input type="button" value="중복확인" ><br>
    비밀번호 : 
    <input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해주세요." required><br>
     비밀번호 확인 : 
     <input type="password" name="passchk2" id="passchk2" placeholder="다시 한번 입력해주세요." required onchange="passCheck()">
     <input type="text" readonly id="passSuc">
     <input type="hidden" required id="passchk">
     <br>
     이름 :
     <input type="text" name="name" id="name" placeholder="이름을 입력해주세요." required ><br>
     E-Mail : 
     <input type="text" name="email1" required id="email1" placeholder="E-Mail을 입력해주세요." >@
     <input type="text" name="email2" required id="email2" readonly="readonly">
     <select name="email2_1" id="email2_1" onchange="emailInput()">
     	<option value="">::메일선택::</option>
        <option value="naver.com">naver.com</option>
        <option value="hanmail.net">hanmail.net</option>
        <option value="nate.com">nate.com</option>
        <option value="gmail.com">gmail.com</option>
        <option value="1">직접입력</option>
     </select><br>
    
    <a onclick="emailCheck()">인증메일받기</a><br>
    인증결과 : <input type="text" id="emailCheckResult" readonly="readonly">
    </form>
    
    
    <script>
    function submitForm(sub){
    	document.forms[sub].submit();
    }
    </script>
     전화번호 : 
     <select name="telecom" required>
      <option value="KT">KT</option>
      <option value="SK">SK</option>
      <option value="LG U+">LG U+</option>
      <option value="알뜰폰">알뜰폰</option>
   </select>&nbsp;&nbsp;
   <select name="tel1">
      <option value="010" selected>010</option>
        <option value="011">011</option>
   </select>
        -
   <input type="text" name="tel2" required maxlength="4" size="4">
        -
   <input type="text" name="tel3" required maxlength="4" size="4"><br>
   <input type="email">
   <br>
   <br>
   <input type="submit" value="join">
   <input type="reset" value="clean">
</form>

</body>

</html>