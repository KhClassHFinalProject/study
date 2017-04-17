<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
href="/myweb/css/mainLayout.css">
<style>
h2{
text-align:center;
}
fieldset {
	width:550px;
	margin:0px auto
}
label{
width:120px;
float:left;
}
section li{
list-style-type:none;
}
section p{
text-align:center;
}
</style>
<script>
function openIdCheck(){
	window.open('idCheck.jsp','idCheck','width=350px','height=200px');
}
function checkPwd(){
	  var f1 = document.forms[0];
	  var pw1 = f1.pwd.value;
	  var pw2 = f1.pwd_check.value;
	  if(pw1!=pw2){
	   document.getElementById('checkPwd').style.color = "red";
	   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
	  }else{
	   document.getElementById('checkPwd').style.color = "black";
	   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
	   
	  }
	  
	 }


</script>
</head>
<body>숙제숙제

<section>
	<article>
	<h2>회원가입</h2>
	<form name="join" action="join_ok.jsp" method="post">
		<ul>
		<li><label>아이디</label>
		<input type="text" name="id" readonly>
		<input type="button" value="중복검사" onclick="openIdCheck()">
		
		</li>
		<li><label>비밀번호</label>
		<input type="password" name="pwd" required="required"></li>
		
		<li><label>비밀번호확인</label>
        <input type="password" name="pwd_check" onchange="checkPwd()"></li>
        <div id="checkPwd"></div>
		
		
		<li><label>이름</label>
		<input type="text" name="name" required="required"></li>
		
		<li><label>전화번호</label>
		<input type="text" name="tel" required="required"></li>
		
		<li><label>주소</label>
		<input type="text" name="addr" required="required"></li>
		
		<li><label>이메일</label>
		<input type="text" name="email" required="required"></li>
		</ul>
		<p>
		<input type="submit" name="join">
		<input type="reset" name="reset">
		</p>		
		


		

</form>
</article>
</section>

</body>
</html>