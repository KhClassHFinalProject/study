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
	<script type="text/javascript" src="/study/jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(
			function() {
				$("#fileTest").change(
					function() {
						if($("#fileTest").val()==""){
							alert("선택파일 없음");
							$("#fileValue").text("");
							$("#fileName").text("");
							$("#nameOnly").text("");
							$("#nameExtension").text("");
							$("#imgTest").prop("src", "");
						}
						else{
							$("#fileValue").text($("#fileTest").val());
							var name=$("#fileTest").val().substring($("#fileTest").val().lastIndexOf("\\")+1);
							$("#fileName").text(name);
							var nameOnly=name.substring(0, name.lastIndexOf("."));
							$("#nameOnly").text(nameOnly);
							var nameExtension=name.substring(name.lastIndexOf(".")+1);
							$("#nameExtension").text(nameExtension);
							if(nameExtension=="jpg"){
								alert("~~이미지 미리보기~~");
								var reader=new FileReader();
								reader.addEventListener("load", function () {$("#imgTest").prop("src", reader.result);}, false);
								var file=$("#fileTest").prop("files")[0];
								if(file){
									reader.readAsDataURL(file);
								}
							}
							else{
								alert("이미지 파일만 미리보기가 가능합니다.");
							}
						}
					}
				);
				$("#submitButton").on("click",
					function() {
						alert("전송은 안함");
					}
				);
			}
		);
	</script>
</head>
<body>

	<h2>[JQ]단일 파일 정보보기</h2>
	
	<input type="file" name="fileTest" id="fileTest">
	<br><br>
	<img src="" name="imgTest" id="imgTest" width="200px" height="200px">
	<br>
	<input type="button" name="submitButton" id="submitButton" value="전송">
	<br><br>
	
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