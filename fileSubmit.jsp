<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.io.File"%>

<%
	try{
		MultipartRequest mr=new MultipartRequest(request, "C:\\Users\\Sang-won\\Desktop\\test\\inFolder", 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		File upfile = mr.getFile("fileTest");
		%>
			<script>
				alert("<%=upfile.getName() %>");
			</script>
		<%
	} catch(Exception e){
		e.printStackTrace();
		%>
		<script type="text/javascript">
			alert("등록실패");
			location.href="file.jsp";
		</script>
	<%
	}
%>

<script>
	location.href="file.jsp";
</script>