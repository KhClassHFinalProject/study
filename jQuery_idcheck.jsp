<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/study/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(opener.document).find('#userid').val("");
			$(opener.document).find('#idHidden').val(false);
// 			opener.document.getElementById("userid").value="";
// 			opener.document.getElementById("idHidden").value="false";
			
		})
		
			var ids=["admin","aaaa", "bbbb"];
		
			function idcheckButton() {
				var inputid = $('#idcheck').val();
				//var inputid=document.getElementById("idcheck").value;
				for(var i=0 ; i<ids.length ; i++){
					if(inputid==ids[i]){
						alert("~~사용중인 아이디 입니다~~");
						$('#useButton').attr('disabled', 'true');
						//document.getElementById("useButton").disabled=true;
						return;
					}
				}
				
				if(inputid==""){
					alert("##공백 입력##");
					$('#useButton').attr('disabled', 'true');
					//document.getElementById("useButton").disabled=true;
				}
				else{
					alert("사용가능한 아이디 입니다.");
					$('#useButton').attr('disabled', false);
					//document.getElementById("useButton").disabled=false;
				}
			}
		
		function useid() {
			$(opener.document).find('#userid').val($('#idcheck').val());
			//opener.document.getElementById("userid").value=document.getElementById("idcheck").value;
			$(opener.document).find('#idHidden').val(true);
			//opener.document.getElementById("idHidden").value="true";
			window.close();
		}
		
		
		
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