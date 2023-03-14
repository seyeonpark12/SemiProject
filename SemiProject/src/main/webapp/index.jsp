<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WPICK</title>
<link rel="favicon" href="layout_image/titlelogo.ico">
<link rel="shortcut icon" type="layout_image/x-icon" href="layout_image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
div.layout {
	border: 0px solid gray;
	position: absolute;
	font-family: 'Gamja Flower', cursive;
}

div.title {
	width: 100%;
	height: 80px;
	line-height: 80px;
	font-size: 25px;
	text-align: center;
}

div.menu {
	width: 100%;
	height: 80px;
	font-size: 20px;
	top: 120px;
	text-align: center;
}

div.info {
	width: 170px;
	height: 200px;
	line-height: 10px;
	font-size: 15pt;
	top: 280px;
	border: 1px solid gray;
	border-radius: 20px;
	left: 50px;
	padding: 20px 10px;
	font-size: 15pt;
	font-family: 'Hi Melody', cursive;
}

div.main {
	width: 1200px;
	height: 800px;
	font-size: 12pt;
	top: 280px;
	left: 300px;
	margin-left: 50px;
}
</style>
</head>
<%
String mainPage = "layout/main.jsp";

//url을 통해서 main값을 읽어서 메인페이지에 출력을 한다
if (request.getParameter("main") != null) {
	mainPage = request.getParameter("main");
}

String root = request.getContextPath();
%>
<body>
영화 메인페이지(index)

	<div class="layout menu">
		<jsp:include page="layout/menu.jsp" />
	</div>

	<div class="layout main">
		<jsp:include page="<%=mainPage%>" />
	</div>
</body>
</html>