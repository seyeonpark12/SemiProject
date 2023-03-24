<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="image/titlelogo.ico">
<link rel="shortcut icon" type="image/x-icon" href="layout_image/titlelogo.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" />
</head>
</head>
<%
String mainPage = "layout/main.jsp";
//url을 통해서 main값을 읽어서 메인페이지에 출력을한다
if (request.getParameter("main") != null) {
	mainPage = request.getParameter("main");
}
String root = request.getContextPath();
%>

<body>
	<div class="layout header">
		<jsp:include page="layout/header.jsp"></jsp:include>

	</div>

	<div class="layout main">
		<jsp:include page="<%=mainPage%>" />
	</div>

	<footer style="top: 200px;">
		<jsp:include page="layout/footer.html"></jsp:include>
	</footer>


	<a href="#site-header" class="fa-solid fa-circle-chevron-up" id="tothetop" style="position: fixed; bottom: 6rem; font-size: 30px; right: 6rem; color: #CBB6D9; cursor: pointer;"></a>

	<script type="text/javascript">
		jQuery('#tothetop').click(function() {
			var htmloffset = jQuery('html').offset();
			jQuery('html, body').animate({
				scrollTop : htmloffset.top
			}, 400);
		});
	</script>

</body>
</html>