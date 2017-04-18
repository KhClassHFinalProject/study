<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script>
var sec=3000;
function rmt(){
	/* 초단위로 변경 */
	sec = sec-1;
	var sec_d = sec%600;
	min = (sec-sec_d)/600;
	sec_d = (sec_d-sec_d%10)/10;
	/* 초단위로 변경 */
		if(sec > 0){
			var result = min + '분' + sec_d + '초';
			document.getElementById('remainTime').value = result;
			window.setTimeout('rmt()',100);
		}	
		if(sec <= 0){
			alert('입력시간이 초과되었습니다. 인증코드를 재발급해주세요');
			window.close();
			
		}
	}
	
</script>
<body onload="rmt();">
<form action="emailCheck.yong" method="post">
<input type="text" name="inputcode" placeholder="이메일로 도착한 코드입력">
<input type="text" id="remainTime" value="" readonly="readonly">
<input type="hidden" name="code" value="${requestScope.code}">
<input type="submit" value="인증하기">
</form>
</body>
</html>
