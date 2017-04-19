<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		var ids=["admin","aaaa", "bbbb"];
		
		function idcheckButton() {
			var inputid=document.getElementById("idcheck").value;
			for(var i=0 ; i<ids.length ; i++){
				if(inputid==ids[i]){
					alert("~~사용중인 아이디 입니다~~");
					document.getElementById("useButton").disabled=true;
					return;
				}
			}
			
			if(inputid==""){
				alert("##공백 입력##");
				document.getElementById("useButton").disabled=true;
			}
			else{
				alert("사용가능한 아이디 입니다.");
				document.getElementById("idcheck").disabled=true
				document.getElementById("idcheck").style.backgroundColor="#D8D8D8";
				document.getElementById("useButton").disabled=false;
			}
		}
		
		function useid() {
			opener.document.getElementById("userid").value=document.getElementById("idcheck").value;
			opener.document.getElementById("idHidden").value="true";
			window.close();
		}
		
		opener.document.getElementById("userid").value="";
		opener.document.getElementById("idHidden").value="false";
	</script>
</head>
<body>
	ID : <input type="text" name="idcheck" id="idcheck">
	<br>
	<input type="button" value="중복검사" onClick="idcheckButton()">
	<input type="button" value="사용하기" id="useButton" disabled="disabled" onClick="useid()">
	<br><br>
	있는 아이디 : admin, aaaa, bbbb
	
</body>
</html>