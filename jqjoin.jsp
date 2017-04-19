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
	<script type="text/javascript" src="/study/jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#idButton").on("click", function() { window.open('jqidcheck.jsp','idcheck','width=300,height=200'); });
		
			$("#userpwd").change(
				function() {
					var pwd1=$("#userpwd");
					var pwd2=$("#userpwdcheck");
					if(pwd1.val()!=""){
						if(pwd2.val()==""){
							pwd2.attr("readOnly", false);
							pwd2.css("backgroundColor", "#ffffff");
							$("#pwdResult").val("PWD체크을 입력하세요");
							$("#pwdResult").css("color", "green");
							$("#pwdHidden").val("false");
						}
						else{
							pwdCheck2();
						}
					}
					else if(pwd1.val()==""){
						pwd2.val("");
						pwd2.attr("readOnly", true);
						pwd2.css("backgroundColor", "#D8D8D8");
						$("#pwdResult").val("비밀번호를 입력하세요");
						$("#pwdResult").css("color", "blue");
						$("#pwdHidden").val("false");
					}
				}
			);
			
			function pwdCheck2() {
				var pwd1=$("#userpwd");
				var pwd2=$("#userpwdcheck");
				if(pwd1.val()==pwd2.val()){
					$("#pwdResult").val("비밀번호를 동일하게 입력하였습니다");
					$("#pwdResult").css("color", "black");
					$("#pwdHidden").val("true");
				}
				else{
					$("#pwdResult").val("PWD와 PWD체크가 다릅니다");
					$("#pwdResult").css("color", "red");
					$("#pwdHidden").val("false");
				}
			}
			
			$("#userpwdcheck").change(
					function() {
						pwdCheck2();
					}
			);
			
			$("#clause").scroll(
				function() {
					var myScrollbarPosition=$("#clause").scrollTop()+$("#clause").height();
					var endPosition=$("#clause")[0].scrollHeight;
					if(myScrollbarPosition==endPosition){
						$('[name=agreeRadio]').attr('disabled', false);
					}
				}
			);
			
			$("[name=agreeRadio]").change(
				function() {
					var radioCheck=$("[name=agreeRadio]").val();
					if(radioCheck=="agree"){
						$("#clauseHidden").val("true");
					}
					else{
						$("#clauseHidden").val("false");
					}
				}
			);
		
		$("#selectEmail").change(
			function() {
				var email=$("#selectEmail").val();
				switch (email) {
					case "0" :
						$("#emailAddr").val("");
						$("#emailAddr").attr("disabled", true);
						$("#emailAddr").css("backgroundColor", "#D8D8D8");
						break;
					case "1" :
						$("#emailAddr").val("naver.com");
						$("#emailAddr").attr("disabled", true);
						$("#emailAddr").css("backgroundColor", "#D8D8D8");
						break;
					case "2" :
						$("#emailAddr").val("daum.net");
						$("#emailAddr").attr("disabled", true);
						$("#emailAddr").css("backgroundColor", "#D8D8D8");
						break;
					case "3" :
						$("#emailAddr").val("google.com");
						$("#emailAddr").attr("disabled", true);
						$("#emailAddr").css("backgroundColor", "#D8D8D8");
						break;
					case "9" :
						$("#emailAddr").val("");
						$("#emailAddr").attr("disabled", false);
						$("#emailAddr").css("backgroundColor", "#ffffff");
						break;
				}
			}
		);
		
		$("#emailChange").on("click",
			function() {
				$("#selectEmail").val("0");
				$("#emailID").val("");
				$("#emailAddr").val("");
				$("#emailAddr").attr("disabled", true);
				$("#emailAddr").css("backgroundColor", "#D8D8D8");
			}
		);
		
		$("#emailButton").on("click",
			function() {
			var emailID=$("#emailID").val();
			var emailAddr=$("#emailAddr").val();
			if(emailID!="" && emailAddr!=""){
				alert("사용 가능");
				$("#emailID").attr("disabled", true);
				$("#emailAddr").attr("disabled", true);
				$("#emailAddr").css("backgroundColor", "#D8D8D8");
				$("#emailHidden").val("true");
			}
			else{
				alert("~~미입력 있음~~");
				$("#emailHidden").val("false");
			}
		});
		
		$("#submitButton").on("click",
			function() {
				alert("ID : " + $("#idHidden").val());
				alert("PWD : " + $("#pwdHidden").val());
				alert("동의 : " + $("#clauseHidden").val());
				alert("email : " + $("#emailHidden").val());
			}
		);
			
		});
	</script>
</head>
<body>
	<h2>JQ 회원가입</h2>
	
	<table>

			<tr>
				<td>
					ID : <input type="text" name="userid" id="userid" readonly="readonly">
					<input type="button" name="idButton" id="idButton" value="중복검사">
				</td>
			</tr>
			
			<tr>
				<td>
					PWD : <input type="text" name="userpwd" id="userpwd" >
					<br>
					PWD 체크 : <input type="text" name="userpwdcheck" id="userpwdcheck" readonly="readonly"> &nbsp;&nbsp;
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
					<input type="radio" name="agreeRadio" value="agree" disabled="disabled">동의
					<input type="radio" name="agreeRadio" value="disagree" disabled="disabled" checked="checked">동의 안함
				</td>
			</tr>
			
			<tr>
				<td>
					이메일 : <input type="text" name="emailID" id="emailID">@<input type="text" name="emailAddr" id="emailAddr" disabled="disabled">
					<select name="selectEmail" id="selectEmail">
						<option value="0">메일을 선택하세요</option>
						<option value="1">네이버</option>
						<option value="2">다음(daum.net)</option>
						<option value="3">구글</option>
						<option value="9">직접 입력</option>
				</select>
				<input type="button" name="emailChange" id="emailChange" value="이메일 수정">
				<input type="button" name="emailButton" id="emailButton" value="이메일 체크">
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="hidden" name="idHidden" id="idHidden" value="false">
					<input type="hidden" name="pwdHidden" id="pwdHidden" value="false">
					<input type="hidden" name="clauseHidden" id="clauseHidden" value="false">
					<input type="hidden" name="emailHidden" id="emailHidden" value="false">
					<input type="button" name="submitButton" id="submitButton" value="가입하기">
				</td>
			</tr>
			
	</table>

</body>
</html>