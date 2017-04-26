<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		#show {
			width:50px;
			height:50px;
			background:#000000;
		}
		#showT {
			width:50px;
			height:50px;
			background:#000000;
		}
		#showT1 {
			width:50px;
			height:50px;
			background:#000000;
		}
		#hide {
			display:none;
			width:50px;
			height:50px;
			background:#000000;
		}
		#hideT1 {
			display:none;
			width:50px;
			height:50px;
			background:#000000;
		}
	</style>
	<script type="text/javascript" src="/study/jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(
			function() {
				function resultText( target ) {
					var $result = $("#result");
					
					$result
						.show()
						.find(".text")
						.show();
					if( !target ) {
						$result.find(".text .description").text("값 없음.");
						if( target == 0 || target == '0' ) {
							if( target.length != 0 ) {
								$result.find(".text .description").text( target );
							} else {
								$result.find(".text .description").text("값 없음.");
							}
						}
					} else {
						$result.find(".description").text( target );
					}
				}


				// 1-1. slideDown_no arguments
				$("#slideDown1Button").click(function() {
					$("#hide").slideDown();
				});

				// 1-2. slideDown_duration
				$("#slideDown2Button").click(function() {
					$("#hide").slideDown(2500);
				});

				// 1-3. slideDown_duration, callback
				$("#slideDown3Button").click(function() {
					$("#hide").slideDown(2500, function() {
						resultText(".slideDown이 완료되었습니다.");
					});
				});

				// 2-1. slideUp_no arguments
				$("#slideUp1Button").click(function() {
					$("#show").slideUp();
				});

				// 2-2. slideUp_duration
				$("#slideUp2Button").click(function() {
					$("#show").slideUp(2500);
				});

				// 2-3. slideUp_duration, callback
				$("#slideUp3Button").click(function() {
					$("#show").slideUp(2500, function() {
						resultText(".slideUp이 완료되었습니다.");
					});
				});

				// 3-1. slideToggle_no arguments
				$("#slideToggle1Button").click(function() {
					$("#showT").slideToggle();
				});

				// 3-2. slideToggle_duration
				$("#slideToggle2Button").click(function() {
					$("#showT").slideToggle(2500);
				});

				// 3-3. slideToggle_duration, callback
				$("#slideToggle3Button").click(function() {
					$("#showT").slideToggle(2500, function() {
						resultText(".slideToggle이 완료되었습니다.");
					});
				});

				// 3-4. slideToggle_advanced_duration, callback
				$("#slideToggle4Button").click(function() {
					// 현재 상태를 보이는 상태(:visible)와 보이지 않는 상태(:hidden)로 구분합니다.
					var status = $("#showT").is(":visible");
				
					$("#showT").slideToggle(2500, function() {
						if( status ) {
							resultText(".slideToggle이 .slideUp상태로 완료되었습니다.");
						} else {
							resultText(".slideToggle이 .slideDown상태로 완료되었습니다.");
						}
					});
				});

				// 3-4-1. slideToggle_advanced_slideDown
				$("#toggle1Button").click(function() {
					$("#hideT1").slideToggle(true);
				});

				// 3-4-2. slideToggle_advanced_slideUp
				$("#toggle2Button").click(function() {
					$("#showT1").slideToggle(false);
				});
			} // document function
		);
	</script>
</head>
<body>
	<!-- 파트2/04/ex2_36 -->
	1. slideDown
	<button type="button" name="slideDown1Button" id="slideDown1Button">.slideDown() 테스트하기</button>
	<button type="button" name="slideDown2Button" id="slideDown2Button">.slideDown(2500) 테스트하기</button>
	<button type="button" name="slideDown3Button" id="slideDown3Button">.slideDown(2500, f) 테스트하기</button>
	<div id="hide"></div>
	
	<br><br>
	2. slideUp
	<button type="button" name="slideUp1Button" id="slideUp1Button">.slideUp() 테스트하기</button>
	<button type="button" name="slideUp2Button" id="slideUp2Button">.slideUp(2500) 테스트하기</button>
	<button type="button" name="slideUp3Button" id="slideUp3Button">.slideUp(2500, f) 테스트하기</button>
	<div id="show"></div>
	
	<br><br>
	3-1 ~ 3-4. slideToggle
	<button type="button" name="slideToggle1Button" id="slideToggle1Button">.slideToggle() 테스트하기</button>
	<button type="button" name="slideToggle2Button" id="slideToggle2Button">.slideToggle(2500) 테스트하기</button>
	<button type="button" name="slideToggle3Button" id="slideToggle3Button">.slideToggle(2500, f) 테스트하기</button>
	<button type="button" name="slideToggle4Button" id="slideToggle4Button">.slideToggle(2500, f+) 테스트하기</button>
	<div id="showT"></div>
	
	<br><br>
	3-4-1. toggle_advanced_show
	<button type="button" name="toggle1Button" id="toggle1Button">.slideToggle(true) 테스트하기</button>
	<div id="hideT1"></div>
	
	<br><br>
	3-4-2. toggle_advanced_hide
	<button type="button" name="toggle2Button" id="toggle2Button">.slideToggle(false) 테스트하기</button>
	<div id="showT1"></div>
	
	<div id="result" style="display:none; margin-top:100px">
		<div class="html" style="display:none">
			<p><strong>* HTML 결과 값</strong></p>
			<p class="description"></p>
		</div>
		<div class="text" style="display:none">
			<p><strong>* TEXT 결과 값</strong></p>
			<p class="description"></p>
		</div>
		<div class="boolean" style="display:none">
			<p><strong>* Boolean 결과 값</strong></p>
			<div class="true" style="color:#fff; background:blue">TRUE</div>
			<div class="false" style="color:#fff; background:red">FALSE</div>
		</div>
		<div class="result_html" style="display:none"></div>
	</div>
</body>
</html>