<%@page import="java.nio.file.Files"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.io.File"%>
<%@page import="java.util.*"%>

<%
	try{
		MultipartRequest mr=new MultipartRequest(request, "C:\\Users\\Sang-won\\Desktop\\test\\inFolder", 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	} catch(Exception e){
		e.printStackTrace();
		%>
		<script type="text/javascript">
			alert("등록실패");
			location.href="fileMultiple.jsp";
		</script>
		<%
	}
%>

<script>
	location.href="fileMultiple.jsp";
</script>