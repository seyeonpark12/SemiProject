<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layoutimage/x-icon"
	href="../layout_image/titlelogo.ico">
<link href="css/info.css" type="text/css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

</head>
<body>
	<div class="myinfo_div">
			<button type="button" class="btn btn-default btn-sm"
			onclick="location.href='index.jsp?main=whatpick/login_mypage.jsp'"
			style="float: right; margin-bottom: 10px;">마이페이지</button>
		
		<h3 style="margin-left: 450px; margin-bottom:50px;">MYPICK</h3>
		
		<div id="moviewrap_pick"
			style="width: 1000px; height: 800px; padding-left: 20px; margin-bottom:-50px;">
			
			<div class="pick"><span class="glyphicon glyphicon-heart" id="zzim"></span></div>
			<!-- 8개 까지만 넣고 나머지는 페이징 처리.. -->
		</div>

	</div>
</body>
</html>