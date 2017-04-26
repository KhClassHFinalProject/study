<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		#box {
			position:absolute;
			top:50px;
			left:0;
			width:50px;
			height:50px;
			background:#000
		}
	</style>
	<script type="text/javascript" src="/study/jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(
			function() {
				// 1. animate
				$("#animateButton").click(function() {
					if( !$("#animateButton").hasClass("action") ) {
						$("#box").animate({ left : $(window).width() - 50 });
						$("#animateButton").addClass("action");
					} else {
						$("#box").animate({ left : 0 });
						$("#animateButton").removeClass("action");
					}
				});

				// 2-1. stop_no arguments
				$("#stopButton").click(function() {
					if( !$("#stopButton").hasClass("action") ) {
						$("#box").stop().animate({ left : $(window).width() - 50 });
						$("#stopButton").addClass("action");
					} else {
						$("#box").stop().animate({ left : 0 });
						$("#stopButton").removeClass("action");
					}
				});


				// 2-2. stop_arguments : IF) jumpToEnd is true
				$("#stop2Button").click(function() {
					if( !$("#stop2Button").hasClass("action") ) {
						$("#box").stop(false, true).animate({ left : $(window).width() - 50 });
						$("#stop2Button").addClass("action");
					} else {
						$("#box").stop(false, true).animate({ left : 0 });
						$("#stop2Button").removeClass("action");
					}
				});

				// 3. delay
				$("#delayButton").click(function() {
					if( !$("#delayButton").hasClass("action") ) {
						$("#box").animate({ left : $(window).width() - 50 }).delay(2000).animate({ left : 0 });
						$("#delayButton").addClass("action");
					} else {
						$("#box").animate({ left : 0 }).delay(2000).animate({ left : $(window).width() - 50 });
						$("#delayButton").removeClass("action");
					}
				});
			} // document function
		);
	</script>
</head>
<body>
	<!-- 파트2/04/ex2_38 -->
	<input type="button" name="animateButton" id="animateButton" value="animate">
	<input type="button" name="stopButton" id="stopButton" value="stop">
	<input type="button" name="stop2Button" id="stop2Button" value="stop2">
	<input type="button" name="delayButton" id="delayButton" value="delay">
	<br><br><br><br>
	<div id="box"></div>
	<ul>
		<li>자세한건 각자 찾아볼 것</li>
		<li>animate : 지정한 위치로 이동</li>
		<li>stop : (animate 여러번 눌러서 작동이 쌓인 후 테스트) 지금 행동하던걸 중지하고 지정위치로 애니메이트 효과로 이동 후 다음 실행</li>
		<li>stop2 : (animate 여러번 눌러서 작동이 쌓인 후 테스트) 지금 행동하던걸 중지하고 지정위치로 바로 이동 후 다음 실행</li>
		<li>delay : 4000ms 후 이동</li>
	</ul>
</body>
</html>