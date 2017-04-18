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
	<script type="text/javascript">
		function filesOn(obj) {
			if(obj.value==""){
				document.getElementById("filesCount").innerText="";
				document.getElementById("filesInfo").innerHTML="";
			}
			else{
				var filesCount=obj.files.length;
				// alert("filesCount : " + filesCount);
				document.getElementById("filesCount").innerText=filesCount;
				
				var str="<table>";
				for(var i=0 ; i<filesCount ; i++){
					var filesValue=obj.value;
					str+="<tr><td>"+(i+1)+"번째 이름</td><td>"+obj.files[i].name+"</td></tr>";
				}
				str+="</table>"
				document.getElementById("filesInfo").innerHTML=str;
			}
		}
	</script>
</head>
<body>
	<form action="fileSubmit2.jsp" method="post" enctype="multipart/form-data">
		<input type="file" multiple="multiple" name="filesTest" id="filesTest" onChange="filesOn(this)">
		<input type="submit" value="보내기">
	</form>
	
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