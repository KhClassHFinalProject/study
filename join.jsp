<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		#clause{
			resize: none;
			width: 200px;
			height: 150px;
			overflow-y: scroll;
			border: 1px solid #000000;
			
			-ms-user-select: none; 
  			-moz-user-select: -moz-none;
  			-khtml-user-select: none;
   			-webkit-user-select: none;
   			user-select: none;
		}
		
		#userid{
			background: #D8D8D8;
		}
		
		#userpwdcheck{
			background: #D8D8D8;
		}
		
		#pwdResult{
			border: 0px;
			width: 400px;
			color: blue;
		}
		
		#emailAddr{
			background: #D8D8D8;
		}
	</style>
	<script type="text/javascript">
		function unlock() {
			document.getElementById("clause").onscroll = function() {
				var myScrollbarPosition=document.getElementById("clause").scrollTop+document.getElementById("clause").clientHeight;
				var endPosition=document.getElementById("clause").scrollHeight;
				if(myScrollbarPosition==endPosition){
					var onOff=document.getElementsByName("agreeRadio");
					for(var i=0 ; i<onOff.length ; i++){
						document.getElementsByName("agreeRadio")[i].disabled=false;
					}
				}
			}
		}
	
		function pwdCheck() {
			var pwd1=document.getElementById("userpwd").value;
			var pwd2=document.getElementById("userpwdcheck").value;
			if(pwd1!=""){
				if(pwd2==""){
					document.getElementById("userpwdcheck").readOnly=false;
					document.getElementById("userpwdcheck").style.backgroundColor="#ffffff";
					document.getElementById("pwdResult").value="PWD체크을 입력하세요";
					document.getElementById("pwdResult").style.color="green";
					document.getElementById("pwdHidden").value="false";
				}
				else{
					pwdCheck2();
				}
			}
			else if(pwd1==""){
				document.getElementById("userpwdcheck").value="";
				document.getElementById("userpwdcheck").readOnly=true;
				document.getElementById("userpwdcheck").style.backgroundColor="#D8D8D8";
				document.getElementById("pwdResult").value="비밀번호를 입력하세요";
				document.getElementById("pwdResult").style.color="blue";
				document.getElementById("pwdHidden").value="false";
			}
		}
		
		function pwdCheck2() {
			var pwd1=document.getElementById("userpwd").value;
			var pwd2=document.getElementById("userpwdcheck").value;
			if(pwd1==pwd2){
				document.getElementById("pwdResult").value="비밀번호를 동일하게 입력하였습니다";
				document.getElementById("pwdResult").style.color="black";
				document.getElementById("pwdHidden").value="true";
			}
			else{
				document.getElementById("pwdResult").value="PWD와 PWD체크가 다릅니다";
				document.getElementById("pwdResult").style.color="red";
				document.getElementById("pwdHidden").value="false";
			}
		}
		
		function emailChange() {
			var email=document.getElementById("selectEmail").value;
			switch(email){
				case "0" :
					document.getElementById("emailAddr").value="";
					document.getElementById("emailAddr").disabled=true;
					document.getElementById("emailAddr").style.backgroundColor="#D8D8D8";
					document.getElementById("emailHidden").value="false";
					break;
				case "1" :
					document.getElementById("emailAddr").value="naver.com";
					document.getElementById("emailAddr").disabled=true;
					document.getElementById("emailAddr").style.backgroundColor="#D8D8D8";
					document.getElementById("emailHidden").value="true";
					break;
				case "2" :
					document.getElementById("emailAddr").value="daum.net";
					document.getElementById("emailAddr").disabled=true;
					document.getElementById("emailAddr").style.backgroundColor="#D8D8D8";
					document.getElementById("emailHidden").value="true";
					break;
				case "3" :
					document.getElementById("emailAddr").value="google.com";
					document.getElementById("emailAddr").disabled=true;
					document.getElementById("emailAddr").style.backgroundColor="#D8D8D8";
					document.getElementById("emailHidden").value="true";
					break;
				case "9" :
					document.getElementById("emailAddr").value="";
					document.getElementById("emailAddr").disabled=false;
					document.getElementById("emailAddr").style.backgroundColor="#ffffff";
					document.getElementById("emailHidden").value="false";
					break;
			}
		}
		
		function emailCheck() {
			var emailID=document.getElementById("emailID").value;
			var emailAddr=document.getElementById("emailAddr").value;
			if(emailID!="" && emailAddr!=""){
				alert("사용 가능");
				document.getElementById("emailHidden").value="true";
			}
			else{
				alert("~~미입력 있음~~");
				document.getElementById("emailHidden").value="false";
			}
		}
		
		function clauseCheck(num) {
			if(num=="1"){
				document.getElementById("clauseHidden").value="true";
			}
			else{
				document.getElementById("clauseHidden").value="false";
			}
		}
		
		function joinSubmit() {
			alert("ID : " + document.getElementById("idHidden").value);
			alert("PWD : " + document.getElementById("pwdHidden").value);
			alert("동의 : " + document.getElementById("clauseHidden").value);
			alert("이메일 : " + document.getElementById("emailHidden").value);
			//document.getElementById("joinForm").submit();
		}
		
		window.addEventListener("load", function() {
			unlock()
		}, false);
	</script>
</head>
<body>
	<form name="joinForm" id="joinForm" action="joinResult.jsp" method="post">
		<table>

			<tr>
				<td>
					ID : <input type="text" name="userid" id="userid" readonly="readonly">
					<input type="button" value="중복검사" onClick="window.open('idcheck.jsp','idcheck','width=300,height=200');">
				</td>
			</tr>
			
			<tr>
				<td>
					PWD : <input type="text" name="userpwd" id="userpwd"  onChange="pwdCheck()">
					<br>
					PWD 체크 : <input type="text" name="userpwdcheck" id="userpwdcheck" readonly="readonly" onchange="pwdCheck2()"> &nbsp;&nbsp;
					<input type="text" name="pwdResult" id="pwdResult" readonly="readonly" value="비밀번호를 입력하세요">
				</td>
			</tr>
			
			<tr>
				<td>
					<div id="clause">
						<%
							for(int i=1 ; i<20 ; i++){
								%><%=i%><br><%
							}
						%>
					</div>
					<input type="radio" name="agreeRadio" disabled="disabled" onClick="clauseCheck(1)">동의
					<input type="radio" name="agreeRadio" disabled="disabled" checked="checked" onClick="clauseCheck(2)">동의 안함
				</td>
			</tr>
			
			<tr>
				<td>
					이메일 : <input type="text" name="emailID" id="emailID">@<input type="text" name="emailAddr" id="emailAddr" disabled="disabled">
					<select name="selectEmail" id="selectEmail" onChange="emailChange()">
						<option value="0">메일을 선택하세요</option>
						<option value="1">네이버</option>
						<option value="2">다음(daum.net)</option>
						<option value="3">구글</option>
						<option value="9">직접 입력</option>
				</select>
				<input type="button" value="이메일 체크" onClick="emailCheck()">
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="hidden" name="idHidden" id="idHidden" value="false">
					<input type="hidden" name="pwdHidden" id="pwdHidden" value="false">
					<input type="hidden" name="clauseHidden" id="clauseHidden" value="false">
					<input type="hidden" name="emailHidden" id="emailHidden" value="false">
					<input type="button" value="가입하기" onClick="joinSubmit()" value="false">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>