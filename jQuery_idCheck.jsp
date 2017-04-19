<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id[] = {"young", "kim", "lee"};

	String userid = request.getParameter("id");
	System.out.println(userid);
	
	boolean result = true;
	for(int i=0; i<id.length; i++){

		if(id[i].equals(userid)){
			result = true;
			break;
		}else{
			result = false;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/study/js/jquery-3.2.1.min.js"></script>
<script>
function useid(){
	$(opener.document).find("#id").val('<%=userid%>');
	$(opener.document).find("#idCheck").val('<%=userid%>');
<%-- 	opener.document.join.id.value='<%=userid%>'; --%>
<%-- 	opener.document.join.idCheck.value='<%=userid%>'; --%>
	window.self.close();
}
</script>
</head>
<body>
<fieldset>
<%
if(result==false){
	%>
	아이디 사용이 가능합니다. <input type="button" value="사용하기" onclick="useid()">
	<%
}else{
	%>
	중복된 아이디 입니다. 다시 검색해 주세요.
	<%
}
%>
	<legend>아이디 중복확인</legend>
	<form name="check" action="idCheck.jsp">
		아이디 : <input type="text" name="id" id="id" value="<%=userid %>">
		<input type="submit" value="중복체크">
	</form>
</fieldset>
</body>
</html>