var ids = ['lsh', 'lsh1', 'lsh2', 'lsh3'];
var checkList = [false, false, false, false];
$(document).ready(function(){
	
})
 	

	function idCheck(){
		var id = $("#id").val();
//		var t = document.getElementById('id');
//		var id = t.value;
		
		var w = false;
		var d = false;
		var notWD = false;
		
		if(id == null || id==""){
			alert("ID를 입력해주세요");
			$('#id').val("").focus();
		}else if(id.length < 5){
			alert("ID는 최소 5자리 이상입니다");
			$('#id').val("").focus();
		}else{
			var result = true;
			// id 중복검사
			for (i = 0; i < ids.length; i++) {
				if(ids[i] == id){
					result = false;
					break;
				}
			}
			// id 영문과 숫자
			var rexD = /[0-9]/;
			var rexW = /[a-zA-Z]/;
			for(i = 0; i < id.length; i++){
				if(rexD.test(id.charAt(i))){
					d = true;
				}else if(rexW.test(id.charAt(i))){
					w = true;
				}else{
					notWD = true;
				}
			}
			
			if(notWD){
				alert('영문, 숫자만 입력하셔야 합니다');
				$('#id').val("").focus();
//				t.value = "";
//				t.autofocus = true;
				
			}else if(result && d && w){
				alert('사용가능한 ID 입니다');
				checkList[0] = true;
			}else if(result && (!d || !w) ){
				alert('ID는 영문과 숫자를 조합하셔야 합니다');
				$('#id').val("").focus();
			}else if(!result){
				alert('이미 등록된 ID 입니다');
				$('#id').val("").focus();
			}
		}
	}

	function pwdChk(){
		var pwd = $("#pwd").val();
		var pwdChk = $("#pwdChk").val();
//		var pwd = document.getElementById('pwd');
//		pwd = pwd.value;
//		var pwdChk = document.getElementById('pwdChk');
//		pwdChk = pwdChk.value;
//		var pwdChkOk = document.getElementById('pwdChkOk');
		if(pwd === null || pwd === ""){
			$("#pwdChkOk").html('비밀번호를 입력해주세요');
// 			pwdChkOk.innerText = "비밀번호를 입력해주세요";
		}else if(pwd==pwdChk){
			$("#pwdChkOk").html('일치');
// 			pwdChkOk.innerText = "일치";
			checkList[1] = true;
		}else{
			$("#pwdChkOk").html('불일치');
// 			pwdChkOk.innerText = "불일치";
		}
	}


	function statePwd(){
		var pwd = $('#pwd').val();
// 		var pwd = document.getElementById('pwd');
// 		pwd = pwd.value;
		pwd = pwd.split("");
		var d = false;
		var sw = false;
		var lw = false;
// 		var statepwd = document.getElementById('statepwd');
		var rexD = /[0-9]/;
		var rexSw = /[a-z]/;
		var rexLw = /[A-Z]/;
		
		if(pwd==null || pwd==""){
			$('#statepwd').html('비밀번호를 입력해주셍');
// 			statepwd.innerText = "비밀번호를 입력해주셍";
		}else if(pwd.length < 5){
			$('#statepwd').html('비밀번호는 최소 5자리 이상입니다');
// 			statepwd.innerText = "비밀번호는 최소 5자리 이상입니다";
		}else{
			for (i = 0; i < pwd.length; i++) {
				if(rexD.test(pwd[i])){
					d = true;
				}else if(rexSw.test(pwd[i])){
					sw = true;
				}else if(rexLw.test(pwd[i])){
					lw = true;
				}
			}
			
			var cnt = 0;
			if(d){cnt = cnt +1;}
			if(sw){cnt = cnt +1;}
			if(lw){cnt = cnt +1;}
			
			if(cnt==3){
				$('#statepwd').html('보안강도 : 강함');
// 				statepwd.innerText = "보안강도 : 강함";
			}else if(cnt==2){
				$('#statepwd').html('보안강도 : 보통');
// 				statepwd.innerText = "보안강도 : 보통";
			}else if(cnt==1){
				$('#statepwd').html('보안강도 : 약함');
// 				statepwd.innerText = "보안강도 : 약함";
			}
		}
		
	}

	function mailSelect(){
		$('#email2').val($('#email').val());
// 		var t = document.getElementById('email');
// 		t = t.value;
// 		var t2 = document.getElementById('email2');
// 		t2.value = t;
	}


	function doMecro(){
		var str = "abcdefghifkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ123456789";
// 		var t = document.getElementById('mecro');
		var result = "";
		for(i = 0; i< 6; i++){
			var num = Math.ceil(Math.random()*str.length);
			result = result+str.charAt(num);
		}
		$('#mecro').html(result);
// 		t.innerText = result;
	}
	function doMecroChk(){
		var t = $('#mecro').html();
// 		var t = document.getElementById('mecro');
// 		t = t.innerText;
// 		var t2 = document.getElementById('mecroChk');
		if(t==$('#mecroChk').val()){
			alert("인증성공");
			$('#mecroChk').prop('disabled', true);
// 			t2.disabled = true;
			checkList[3] = true;
		}else{
			alert("인증실패");
			doMecro();
		}
	}

	function chkAll(){
// 		var t = document.getElementById('chk1');
		if($('#chk1').prop('checked')){
			checkList[2] = true;
		}
		if(checkList[0] && checkList[1] && checkList[2] && checkList[3]){
			alert("가입완료");
		}else{
			for(i=0; i< checkList.length; i++){
				if( !checkList[i] && i == 0){
					alert('아이디를 확인해주시기 바랍니다');
					break;
				}else if( !checkList[i] && i == 1){
					alert('비밀번호를 확인해주세요');
					break;
				}else if( !checkList[i] && i == 2){
					alert('약관을 맨 아래까지 읽고 약관에 동의해주세요');
					break;
				}else if( !checkList[i] && i == 3){
					alert('자동가입방지문구를 바르게 입력해주세요');
					break;
				}
			}
		}
	}

	function nameChk(){
		var name = $('#name').val();
// 		var t = document.getElementById('name');
// 		var name = t.value;
		name = name.split("");
		var kor = true;
		var rexK = /[가-힣]/;
		for(i = 0; i< name.length; i++){
			if( !(rexK.test(name[i])) ){
				kor = false;
			}
		}
		
		if(!kor){
			alert('이름을 정확히 입력해 주시기 바랍니다');
			$('#name').val("").focus();
// 			t.value = "";
		}
	} 




