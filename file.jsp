<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		body{
			padding: 80px;
		}
		table{
			border: 1px solid #000000;
		}
		table td{
			border: 1px solid #000000;
			width: 400px
		}
	</style>
	<script type="text/javascript">
		function fileOn(object) {
			var objValue=object.value;
			if(objValue==""){
				alert("선택파일 없음");
				document.getElementById("fileValue").innerText="";
				document.getElementById("fileName").innerText="";
				document.getElementById("nameOnly").innerText="";
				document.getElementById("nameExtension").innerText="";
				document.getElementById("imgTest").src="";
			}
			else{
				var temp1=objValue.split("\\");
				var name=temp1[temp1.length-1];
				var temp2=name.split(".");
				var nameOnly=temp2[0];
				var nameExtension=temp2[1];
				
				/* alert("fileValue : " + objValue);
				alert("fileName : " + name);
				alert("nameOnly : " + nameOnly);
				alert("nameExtension : " + nameExtension); */
				
				document.getElementById("fileValue").innerText=objValue;
				document.getElementById("fileName").innerText=name;
				document.getElementById("nameOnly").innerText=nameOnly;
				document.getElementById("nameExtension").innerText=nameExtension;
				
				if(nameExtension=="jpg"){
					alert("~~이미지 미리보기~~");
					var reader=new FileReader();
					reader.addEventListener("load", function () {document.getElementById("imgTest").src=reader.result;}, false);
					if(object.files[0]){
						reader.readAsDataURL(object.files[0]);
					}
				}
				else{
					alert("이미지 파일만 미리보기가 가능합니다.");
				}
			}
			
		}
	</script>
</head>
<body>
	<form action="fileSubmit.jsp" method="post" enctype="multipart/form-data">
		<input type="file" name="fileTest" id="fileTest" onChange="fileOn(this)">
		<br><br>
		<img src="" name="imgTest" id="imgTest" width="200px" height="200px">
		<br>
		<input type="submit" value="전송">
		<br><br>
	</form>
	
	<table>
		<tr>
			<td>파일 위치(임시위치)</td>
			<td><span id="fileValue"></span></td>
		</tr>
		<tr>
			<td>파일 이름</td>
			<td><span id="fileName"></span></td>
		</tr>
		<tr>
			<td>파일 이름만</td>
			<td><span id="nameOnly"></span></td>
		</tr>
		<tr>
			<td>파일 확장자만</td>
			<td><span id="nameExtension"></span></td>
		</tr>
	</table>
</body>
</html>