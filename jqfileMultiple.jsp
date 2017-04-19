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
			width: 200px
		}
		#filesInfo{
			padding: 5px;
		}
	</style>
	<script type="text/javascript" src="/study/jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(
			function() {
				$("#filesTest").change(
					function() {
						if($("#filesTest").val==""){
							$("#filesCount").text("");
							$("#filesInfo").html("");
						}
						else{
							var filesCount=$("#filesTest").prop("files").length;
							$("#filesCount").text(filesCount);
							
							
							var str="<table>";
							for(var i=0 ; i<filesCount ; i++){
								var filesValue=$("#filesTest").val();
								str+="<tr><td>"+(i+1)+"번째 이름</td><td>"+$("#filesTest")[0].files[i].name+"</td></tr>";
							}
							str+="</table>"
							$("#filesInfo").html(str);
						}
					}
				);
				$("#submitButton").on("click",
					function() {
						alert("전송은 안시킴");
					}
				);
			}
		);
	</script>
</head>
<body>
	<h2>[JQ]다중 파일 정보보기</h2>
	
	<input type="file" multiple="multiple" name="filesTest" id="filesTest">
	<input type="button" name="submitButton" id="submitButton" value="보내기">
	
	<table>
		<tr>
			<td>파일 개수</td>
			<td><span id="filesCount"></span></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<div id="filesInfo"></div>
			</td>
		</tr>
	</table>
	
</body>
</html>