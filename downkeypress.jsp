<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/study/jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#testText").keypress(function(obj) {
				var str=String.fromCharCode(event.keyCode);
				alert("press : " + str);
			})
			$("#testText").keydown(function(obj) {
				var str=String.fromCharCode(event.keyCode);
				alert("down : " + str);
			})
		})
	</script>
</head>
<body>
	<input type="text" name="testText" id="testText">
</body>
</html>