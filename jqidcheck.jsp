<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/study/jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		var ids=["admin","aaaa", "bbbb"];
		
		$("#userid", opener.document).val("");
		$("#idHidden", opener.document).val("false");
		
		$(document).ready(function() {
			$("#idCheckButton").on("click",
				function() {
					var userInput=$("#idcheck").val();
					for(var i=0 ; i<ids.length ; i++){
						if(userInput==ids[i]){
							alert("~~사용중인 아이디 입니다~~");
							$('#idUseButton').attr('disabled',true);
							return;
						}
					}
					if(userInput==""){
						alert("##공백 입력##");
						$('#idUseButton').attr('disabled',true);
					}
					else{
						alert("사용가능한 아이디 입니다.");
						$('#idUseButton').attr('disabled',false);
				}
			});
			$("#idUseButton").on("click",
				function() {
					var userInput=$("#idcheck").val();
					$("#userid", opener.document).val(userInput);
					$("#idHidden", opener.document).val("true");
					window.close();
				})
			});
	</script>
</head>
<body>
	<h2>JQ ID체크</h2>
	
	ID : <input type="text" name="idcheck" id="idcheck">
	<br><br>
	<input type="button" name="idCheckButton" id="idCheckButton" value="중복검사">
	<input type="button" name="idUseButton" id="idUseButton" value="사용하기" disabled="disabled">
	<br><br>
	있는 아이디 : admin, aaaa, bbbb

</body>
</html>