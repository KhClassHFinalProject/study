<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String inputcode = request.getParameter("inputcode");
/* String code = (String)request.getAttribute("code"); */
String code = request.getParameter("code");
System.out.println("code = "+code);
if(inputcode.equals(code)){
	%>
	<script>
	alert('인증되었습니다.');
	</script>
	<%
}else{
	%>
	<script>
	alert('인증실패');
	</script>
	<%
}
%>