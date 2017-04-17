<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="doMecro()">
<!-- 과제 1차시 회원가입
약관 동의( 아래까지 읽고 체크하면 )  O
아이디(강제변수 만들어 놓고 확인 ) O
비밀번호  O
비밀번호 확인  O
이메일(주소선택과 직접입력 깔끔하게)O
자동(매크로)가입방지확인문자 O -->
아이디 : <input type="text" name="id" id="id" maxlength="12" autofocus="autofocus"/> <input type="button" value="아이디 중복확인" onclick="idCheck()"/> <br />
<div>[아이디 유효성 검사 항목]  길이는5~12,  영문과 숫자 섞어야 가능, 기존에 등록된 아이디면 사용불가</div><br />
비밀번호 : <input type="password" name="pwd" id="pwd" onblur="statePwd(),pwdChk()" maxlength="14"/> <span id="statepwd"></span> <br />
<div>[비밀번호 유효성 검사 항목]  길이는5~14,  영문소문자, 대문자, 숫자로 구성하여 이들이 모두 포함되면 강함, 두개면 보통, 하나면 약함 으로 표시</div><br />
비밀번호 확인 : <input type="password" name="pwdChk" id="pwdChk" onkeyup="pwdChk()"/> <span id ="pwdChkOk"></span><br />
<div>[비밀번호 확인 유효성 검사 항목]  비밀번호가 비어있으면 "입력바람", 비밀번호랑 일치하면 "일치", 아니면 "불일치"</div><br />
이름 : <input type="text" name="name" id="name" onblur="nameChk()"/> <br />
<div>[이름 유효성 검사 항목]  이름이 한글이 아니거나 자음, 모음만 들어있을 경우 포커스 아웃될 경우 땡</div><br />
E-mail : <input type="text" name="email1" id="email1" />@ 
<input type="text" name="email2" id="email2" />
<select id="email" onchange="mailSelect()">
	<option selected="selected">메일을 선택해주세요</option>
	<option >naver.com</option>
	<option value="daum.net">daum.net</option>
	<option value="google.co.kr">google.co.kr</option>
	<option value="yahoo.co.kr">yahoo.co.kr</option>
	<option value="">직접입력</option>
</select>
 <br />
<div>[E-Mail 기능]  메일을 선택함에 따라 자동으로 뒷 주소가 따라옴</div><br />
주소 : <input type="text" name="addr" id="addr" /> <br />
전화번호 : <input type="text" name="tel" id="tel" /> <br />
이용약관
<div style="overflow:scroll; width:500px; height:200px;">
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
쏼라<br />
<input type="checkbox" name="chk1" id="chk1"/>다 읽고 동의했어요
</div> <br />
<div>[이용약관 유효성검사]  맨 아래 체크박스를 체크해야 가입 가능</div><br />

자동가입방지<br />
<span id="mecro" ondragstart="return false" ></span><br />
<input type="text" name="mecroChk" id="mecroChk" />
<input type="button" value="저는 로봇이 아닙니다" onclick="doMecroChk()"/><br />
<div>[자동가입방지 유효성검사]  페이지 새로고침마다 값이 바뀌고 이와 똑같은 값을 입력해야 가입 가능. 인증 실패하면 새로운 값을 제시, 인증 성공하면 입력을 못하게 막음</div><br />



<input type="button" value="가입하기" onclick="chkAll()"/>

<script type="text/javascript" src="ex01.js"></script>
</body>
</html>