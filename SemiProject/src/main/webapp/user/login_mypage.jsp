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
			<h3>회원정보</h3>
			<a class="editbtn" href='index.jsp?main=user/user_updateform.jsp'">EDIT</a>

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


		<a class="morebtn" href='index.jsp?main=whatpick/login_mypickpage.jsp'">+MORE</a>

		<div id="moviewrap_pick">
			<h3 style="margin-bottom: 30px;">MYPICK</h3>

			<div class="pick">
				<span class="glyphicon glyphicon-heart" id="zzim"></span>
			</div>
			
			<!-- 최대 4개까지만 보이게 하기.. -->
		</div>



		<a class="morebtn"
			href='index.jsp?main=whatpick/login_mypage_mywrite.jsp'">+MORE</a>

		<table style="width: 1000px;">
			<h3>내가 쓴 글보기</h3>
			<tr class="tr_myinfo">
				<th width="200" class="myinfo">카테고리</th>
				<th width="800" class="myinfo">제목</th>
			</tr>

			<tr>
				<td colspan="5" align="center" class="myinfo">
					<h3>등록된 게시글이 없습니다</h3>
					<!-- 최대 8개까지만 보이게 하기.. -->
				</td>
			</tr>
		</table>

		<a class="morebtn"
			href='index.jsp?main=whatpick/login_mypage_myreview.jsp'">+MORE</a>

		<table style="width: 1000px;">
			<h3>내가 쓴 리뷰보기</h3>
			<tr class="tr_myinfo">
				<th width="200" class="myinfo">영화제목</th>
				<th width="600" class="myinfo">리뷰</th>
				<th width="200" class="myinfo">날짜</th>
			</tr>

			<tr>
				<td colspan="5" align="center" class="myinfo">
					<h3>등록된 게시글이 없습니다</h3>
					<!-- 최대 8개까지만 보이게 하기.. -->
				</td>
			</tr>
		</table>


		<a class="morebtn"
			href='index.jsp?main=whatpick/login_mypage_mycomment.jsp'">+MORE</a>

		<table style="width: 1000px;">
			<h3>내가쓴댓글보기</h3>
			<tr class="tr_myinfo">
				<th width="200" class="myinfo">카테고리</th>
				<th width="800" class="myinfo">제목</th>
			</tr>

			<tr>
				<td colspan="5" align="center" class="myinfo">
					<h3>등록된 게시글이 없습니다</h3>
					<!-- 최대 8개까지만 보이게 하기.. -->
				</td>
			</tr>
		</table>

	</div>
</body>
</html>