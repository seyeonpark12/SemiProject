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

<link href="css/info.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

</head>
<body>
	<div class="myinfo_div">
		<table style="width: 1000px;">
			<h3>내가쓴댓글보기</h3>
			<tr class="tr_myinfo">
				<th width="200" class="myinfo">카테고리</th>
				<th width="800" class="myinfo">제목</th>
			</tr>

			<tr>
				<td colspan="5" align="center" class="myinfo">
					<h3>등록된 게시글이 없습니다</h3>
				</td>
			</tr>
		</table>

		<button type="button" class="btn btn-default btn-sm"
			onclick="location.href='index.jsp?main=mypage/mypage_form.jsp'"
			style="margin-left: 450px; margin-bottom: 10px;">마이페이지</button>
	</div>
</body>
</html>