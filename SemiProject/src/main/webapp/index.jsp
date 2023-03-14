<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="image/titlelogo.ico">
<link rel="shortcut icon" type="image/x-icon" href="layout_image/titlelogo.ico">
<!--  
<script type="text/javascript">
	$(".modal-content").load("");
</script>
-->
</head>
<%
	String mainPage="layout/main.jsp";
    //url을 통해서 main값을 읽어서 메인페이지에 출력을한다
    if(request.getParameter("main")!=null)
    {
    	mainPage=request.getParameter("main");
    }
 String root=request.getContextPath();
%>

<body>
<div class="layout header">
  <jsp:include page="layout/header.jsp"></jsp:include>
 
</div>

<div class="layout main">
   <jsp:include page="<%=mainPage %>"/>
</div>

<footer style="positon:absolute; top:2000px;">
	<jsp:include page="layout/footer.html"></jsp:include>
</footer>

</body>
</html>