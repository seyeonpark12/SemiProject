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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
	list-style: none;
	font-family: "Noto Sans KR";
	color: black;
}

tr th td {
	text-align: center;
}

.ca_subject {
	font-size: 15px;
	font-weight: 400;
	letter-spacing: -1.2px;
	line-height: 36px;
}

.myinfo {
	font-size: 15px;
	letter-spacing: -1.2px;
	line-height: 50px;
}

th.myinfo {
	text-align: center;
}

#moviewrap_pick>div {
	float: left;
	border:1px solid black;
	width: 200px;
	height: 300px;
	margin-left:30px;
	font-size: 20px;
	line-height: 100px;
	text-align: center;
}

#moviewrap_pick ::afrer {
	content: "";
	display: block;
	clear: both;
}

 #zzim{
      color: red;
      z-index: 10;
      font-size:35px;
      position: relative;
      float:right; 
      margin-top:230px;
      padding:20px;
   }
   
</style>
</head>
<body>

	<br>
	<br>

	<div style="margin-left: 500px; width: 1000px; padding: 0;">

		<h3 stlye=" font-size:20px; margin-bottom:-200px;">내가 쓴 리뷰보기</h3>


		<table class="table table-bordered" style="width: 1000px;">

			<tr>
				<th width="200" class="myinfo">영화제목</th>
				<th width="600" class="myinfo">리뷰</th>
				<th width="200" class="myinfo">날짜</th>
			</tr>

			<tr>
				<td colspan="5" align="center">
					<h3>등록된 게시글이 없습니다</h3>
				</td>
			</tr>

		</table>
		
		<button type="button" class="btn btn-default btn-sm"
			onclick="location.href='index.jsp?main=whatpick/login_mypage.jsp'"
			style="float: right; margin-bottom: 10px;">마이페이지</button>
			
	</div>
</body>
</html>