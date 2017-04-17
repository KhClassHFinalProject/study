<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function Chk_Text(){
   var ChkID = document.getElementById('id').value;
    var ChkText=/^([a-zA-Z0-9]{1,20})$/
    if(ChkText.test(ChkID)==false){
            alert("'"+ChkID + "' 는 사용이 불가능 합니다. \n 영문문자나 숫자 아이디만 사용이 가능합니다.");
            return;
      }
}

function checkEmail(){
    if (document.getElementById('email2_1').value == '1') {
        document.getElementById('email2').readOnly = false;
        document.getElementById('email2').value = '';
        document.getElementById('email2').focus();
    }else{
        document.getElementById('email2').readOnly = true;
        document.getElementById('email2').value = document.getElementById('email2_1').value;
    }
}



//숫자만 입력 받게끔 하는 함수.
function handlerNum( obj ) {
  e = window.event; //윈도우의 event를 잡는것입니다.
  
  //입력 허용 키
  if( ( e.keyCode >=  48 && e.keyCode <=  57 ) ||   //숫자열 0 ~ 9 : 48 ~ 57
      ( e.keyCode >=  96 && e.keyCode <= 105 ) ||   //키패드 0 ~ 9 : 96 ~ 105
        e.keyCode ==   8 ||    //BackSpace
        e.keyCode ==  46 ||    //Delete
        //e.keyCode == 110 ||    //소수점(.) : 문자키배열
        //e.keyCode == 190 ||    //소수점(.) : 키패드
        e.keyCode ==  37 ||    //좌 화살표
        e.keyCode ==  39 ||    //우 화살표
        e.keyCode ==  35 ||    //End 키
        e.keyCode ==  36 ||    //Home 키
        e.keyCode ==   9       //Tab 키
    ) {
  
    if(e.keyCode == 48 || e.keyCode == 96) { //0을 눌렀을경우
      if ( obj.value == "" || obj.value == '0' ) //아무것도 없거나 현재 값이 0일 경우에서 0을 눌렀을경우
        e.returnValue=false; //-->입력되지않는다.
      else //다른숫자뒤에오는 0은
        return; //-->입력시킨다.
      }

    else //0이 아닌숫자
      return; //-->입력시킨다.
    }
    else //숫자가 아니면 넣을수 없다.
 {
  alert('숫자만 입력가능합니다');
  e.returnValue=false;
 }
}

//자동가입방지 문자생성기
var keylist='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789';
var temp='';

//문자 생성하기
function generatePass(){
   temp = '';
   for(i = 0; i<8;i++){
      temp+=keylist.charAt(Math.floor(Math.random()*keylist.length));
   }
   document.getElementById('output').value = temp;
}

//생성한 문자와 입력한 문자 비교
function checkRobot(){
   if(temp == document.getElementById('chk').value){
      document.getElementById('imnotrobot').value='success';
      window.alert('사람입니다');
   }else{
      document.getElementById('chk').value='';
      generatePass();
      document.getElementById('imnotrobot').value='';
      window.alert('로봇입니다.');
   }
}

//비밀번호 확인
function passCheck(){
   if(document.getElementById('pass').value==document.getElementById('passchk2').value){
      document.getElementById('passSuc').value='비밀번호가 일치합니다.';
      document.getElementById('passchk').value='correct';
   }else{
      document.getElementById('passSuc').value='비밀번호가 틀렸습니다.';   
      document.getElementById('passchk').value='';
   }
   
}
//임시아이디목록
var bar = new Array('sanghun', 'taeyoung', 'daewon', '0joooo', 'sanwon', 'zaezin', 'minje' );

//아이디 체크
function idCheck(){
   var userid = document.getElementById('id').value; 
   for (var i = 0; i < bar.length; i++){
      if(userid==bar[i]){
         window.alert('중복된 아이디 입니다!');
         document.getElementById(id).value='';
         break;
      }
   }
   window.alert(userid+'는 사용가능한 아이디 입니다.');
}
</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" onload="generatePass()">
<h2>회 원 가 입</h2>
<form name="join" action="joinTest_ok.jsp">
    *아이디 : 
    <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요." required onKeydown="javascript:Chk_Text()">
    <input type="button" value="중복확인" onclick="idCheck()"><br>
    *비밀번호 : 
    <input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해주세요." required><br>
     *비밀번호 확인 : 
     <input type="password" name="passchk2" id="passchk2" placeholder="다시 한번 입력해주세요." required onChange="javascript:passCheck();">
     <input type="text" readonly id="passSuc">
     <input type="hidden" required id="passchk">
     <br>
     *이름 :
     <input type="text" name="name" placeholder="이름을 입력해주세요." required><br>
     *E-Mail : 
     <input type="text" name="email1" required onKeydown="javascript:notSpecial()" placeholder="E-Mail을 입력해주세요.">@
     <input type="text" name="email2" required id="email2" readonly="readonly" required>
     <select name="email2_1" id="email2_1" onChange="checkEmail();">
        <option value="">이메일을 선택하세요.</option>
        <option value="naver.com">naver.com</option>
        <option value="hanmail.net">hanmail.net</option>
        <option value="nate.com">nate.com</option>
        <option value="gmail.com">gmail.com</option>
        <option value="1">직접입력</option>
     </select><br>
     <input type="checkbox" name="joinAgree" value="emailok">각종 이벤트 알림 등의 메일 수신에 동의 합니다.<br>
     *전화번호 : 
     <select name="telecom" required>
      <option value="KT">KT</option>
      <option value="SK">SK</option>
      <option value="LG U+">LG U+</option>
      <option value="알뜰폰">알뜰폰</option>
   </select>&nbsp;&nbsp;
   <select name="tel1">
      <option value="010" selected>010</option>
        <option value="011">011</option>
   </select>
        -
   <input type="text" name="tel2" required maxlength="4" onKeydown='javascript:handlerNum(this)' size="4">
        -
   <input type="text" name="tel3" required maxlength="4" onKeydown='javascript:handlerNum(this)' size="4"><br>
     <input type="checkbox" name="joinAgree" value="telok">각종 이벤트 알림 등의 SMS수신에 동의 합니다.
   <br>
   <input type="text" name="output" id="output" readonly ondragstart="return false">
   <input type="button" value="코드 생성" onclick="generatePass()">
   <input type="text" size="18" name="chk" id="chk">
   <input type="button" value="비교" onclick="checkRobot()">
   <input type="text" readonly name="imnotrobot" id="imnotrobot" required size="4">
   <br><br>
   <input type="submit" value="join">
   <input type="reset" value="clean">
</form>
</body>
</html>