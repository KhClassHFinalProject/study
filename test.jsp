<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<section>
		max=4 : <input type="number" max="4"><br>
		maxlength=5 : <input type="number" maxlength="5"><br>
		min=6 : <input type="number" min="6"><br>
	</section>
	
	<hr>
	
	<section>
		maxlength=5 : <input type="number" name="num" id="num" maxlength="5" onInput="lengthCheck(this)"><br>
	</section>
</body>
</html>