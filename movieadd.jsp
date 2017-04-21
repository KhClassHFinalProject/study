<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	</style>
	<script type="text/javascript" src="/study/jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(
			function() {
				$("body").css("text-align", "center");
				$("table").css("margin-left", "auto").css("margin-right", "auto");
				
				var rowCount=15; // 행 갯수
				var colCount=9; // 열 갯수 #두자리수는 키보드에 없음, 0은 영문 표시줄이라 미사용
				// 65-A ~ 90-Z
				// 0[48] ~ 9[57]
				for(var i=0 ; i<rowCount ; i++){
					$("#tableRow").append("<option>" +String.fromCharCode(i+65)+ "</option>");
				}
				
				for(var i=1 ; i<colCount ; i++){
					$("#tableCol").append("<option>" +(i+1)+ "</option>");
				}
				
				$("#tableButton").on("click",
					function() {
						//alert("row : " + $("#tableRow").val());
						//alert("rowChar : " + $("#tableRow").val().charCodeAt(0));
						//alert("col : " + $("#tableCol").val());
						var rowVal=$("#tableRow").val().charCodeAt(0);
						var colVal=$("#tableCol").val();
						$("#tableRow").prop("disabled", true);
						$("#tableCol").prop("disabled", true);
						$("#tableButton").prop("disabled", true);
						
						for(var i=65-1 ; i<rowVal ; i++){
							var rowName=String.fromCharCode(i+1);
							var tableElement="<tr><td class=" +rowName+ ">" +rowName+ "</td>";
							for(var j=0 ; j<colVal ; j++){
								tableElement+="<td class=" +rowName+ ">" +(j+1)+ "</td>";
							}
							tableElement+="</tr>";
							$("table").append(tableElement);
							$("."+rowName+":gt(0)").css("border", "1px solid #000000");
						}
						$("table td").css("padding", "15px");
						$(".step").eq(0).prop("checked", true);
					}
				);
				
				$(document).keypress(
					function() {
						var rowVal=$("#tableRow").val().charCodeAt(0);
						var colVal=$("#tableCol").val();
						var keyString=String.fromCharCode(event.keyCode).toUpperCase();
						var keyChar=keyString.charCodeAt(0);
						
						if($(".step").eq(0).is(":checked")!=true){
							return;
						}
						else if($(".step").eq(1).is(":checked")!=true){
							if(keyChar>64 && keyChar<=rowVal){
								$("."+keyString+":gt(0)").css("background-color", "#ffff00");
								$(".step").eq(1).prop("checked", true);
								$(".step").eq(1).val(keyString);
							}
							return;
						}
						else if($(".step").eq(2).is(":checked")!=true){
							if(keyChar>48 && keyChar<=colVal.charCodeAt(0)){
								var rowPosition=$(".step").eq(1).val();
								$("."+rowPosition+":gt(0)").css("background-color", "#ffffff");
								$("."+rowPosition+":eq("+keyString+")").css("background-color", "#0000ff");
								$(".step").eq(2).prop("checked", true);
								alert("선택자리 : " + rowPosition + keyString);
							}
							return;
						}
					}
				);
				
				$("#tableReset").on("click",
					function() {
						location.reload();
					}
				);
				
				$("table").on("click",
					function() {
						var rowName=event.target.className;
						var colName=$(event.target).text();
						if(colName<1){
							return;
						}
						if($(".step").eq(1).is(":checked")==true || $(".step").eq(2).is(":checked")==true){
							return;
						}
						$("."+rowName+":eq("+colName+")").css("background-color", "#0000ff");
						alert("선택자리 : " + rowName + colName);
						$(".step").eq(1).prop("checked", true);
						$(".step").eq(2).prop("checked", true);
					}
				);
				
			} // ready function
		);
		
	</script>
</head>
<body>
	행<select name="tableRow" id="tableRow"></select>
	&nbsp; 열<select name="tableCol" id="tableCol"></select>
	&nbsp;<input type="button" name="tableButton" id="tableButton" value="테이블 작성">
	&nbsp;<input type="button" name="tableReset" id="tableReset" value="초기화">
	<hr>
	<input type="radio" class="step" disabled="disabled"><input type="radio" class="step" disabled="disabled"><input type="radio" class="step" disabled="disabled">
	<table></table>
</body>
</html>