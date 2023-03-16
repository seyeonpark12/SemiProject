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
		<table style="width: 700px;">

			<h3>관리자정보</h3>

			<a class="editbtn" href='index.jsp?main=whatpick/admin_updateform.jsp'">EDIT</a>
			<tr>
				<th class="myinfo" width="200">이름</th>
				<td class="myinfo" width="500">&nbsp;&nbsp;&nbsp;이름(dto값)</td>
			</tr>
			<tr>
				<th class="myinfo">닉네임</th>
				<td class="myinfo">&nbsp;&nbsp;&nbsp;닉네임(dto값)</td>
			</tr>
			<tr>
				<th class="myinfo">이름</th>
				<td class="myinfo">&nbsp;&nbsp;&nbsp;이름(dto값)</td>
			</tr>
			<tr>
				<th class="myinfo">아이디</th>
				<td class="myinfo">&nbsp;&nbsp;&nbsp;아이디(dto값)</td>
			</tr>

			<tr>
				<th class="myinfo" width="100">비밀번호</th>
				<td class="myinfo" width="250">&nbsp;&nbsp;&nbsp;비밀번호(dto값)</td>
			</tr>
			<tr>
				<th class="myinfo" width="100">주소</th>
				<td class="myinfo" width="250">&nbsp;&nbsp;&nbsp;주소(dto값)</td>
			</tr>

			<tr>
				<th class="myinfo" width="100">이메일</th>
				<td class="myinfo" width="250">&nbsp;&nbsp;&nbsp;이메일(dto값)</td>
			</tr>

		</table>


		<a class="morebtn"
			href='index.jsp?main=whatpick/admin_peoplelist.jsp'">+MORE</a>

		<table style="width: 1000px;">
			<h3>회원목록</h3>
			<tr>
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
				<td colspan="8" align="center">
					<h3>등록된 게시글이 없습니다</h3>
				</td>
			</tr>



		</table>

	</div>
</body>
</html>