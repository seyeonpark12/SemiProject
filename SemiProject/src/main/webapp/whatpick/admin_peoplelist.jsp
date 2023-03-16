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
		<table style="width: 1000px;">
			<h3>회원목록</h3>
			<tr class="tr_myinfo">
				<th width="50" class="myinfo">NO</th>
				<th width="100" class="myinfo">이름</th>
				<th width="100" class="myinfo">닉네임</th>
				<th width="100" class="myinfo">아이디</th>
				<th width="200" class="myinfo">비밀번호</th>
				<th width="150" class="myinfo">휴대전화</th>
				<th width="200" class="myinfo">주소</th>
				<th width="100" class="myinfo">가입날짜</th>
			</tr>

			<tr>
				<td colspan="8" align="center" class="myinfo">
					<h3>등록된 게시글이 없습니다</h3>
				</td>
			</tr>

		</table>
		<button type="button" class="btn btn-default btn-sm"
			style="margin-left: 450px; margin-bottom: 10px;">삭제</button>

		<button type="button" class="btn btn-default btn-sm"
			onclick="location.href='index.jsp?main=whatpick/admin_mypage.jsp'"
			style="margin-bottom: 10px; margin-right: 10px;">관리자페이지</button>
	</div>


</body>
</html>