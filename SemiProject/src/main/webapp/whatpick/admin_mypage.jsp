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
	<div
		style="margin-left: 500px; width: 1000px; padding: 0;">

		<h3>관리자정보</h3>
		<br>
		<table class="table table-bordered" style="width: 700px;">

			<button type="button" class="btn btn-default btn-sm"
				onclick="location.href='index.jsp?main=whatpick/admin_updateform.jsp'"
				style="float: right; margin-bottom: 10px;">수정하기</button>

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
		
<h3 stlye=" font-size:20px; margin-bottom:-200px;">회원목록</h3>
<button type="button" class="btn btn-default btn-sm"
			onclick="location.href='index.jsp?main=whatpick/admin_peoplelist.jsp'"
			style="float: right; margin-bottom: 10px;">더보기</button>


		<table class="table table-bordered" style="width: 1000px;">

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