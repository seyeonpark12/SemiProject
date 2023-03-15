<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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

tr th {
	text-align: center;
}
</style>
</head>
<body>

	<div class="category"
		style="width: 1000px; margin-top: 100px; margin-left: 860px;">
		<div style="float: left;">
			<a href="#"
				style="font-size: 18px; font-weight: bold; color: black; padding-right: 10px;">전체
				|</a>
		</div>
		<div style="float: left;">
			<a href="#"
				style="font-size: 18px; color: black; padding-right: 10px;">자유 |</a>
		</div>
		<div style="float: left;">
			<a href="#"
				style="font-size: 18px; color: black; padding-right: 10px;">동행 |</a>
		</div>
		<div style="float: left;">
			<a href="#"
				style="font-size: 18px; color: black; padding-right: 10px;">나눔</a>
		</div>
	</div>
	
	<br>
	<div style="margin: 30px 30px; padding-left: 40px;">
		<br>

		<table class="table table-bordered" style="width: 1000px;">

			<tr>
				<th width="70">NO</th>
				<th width="120">글쓴이</th>
				<th width="500">제목</th>
				<th width="100">작성일</th>
				<th width="60">조회수</th>
			</tr>

			<tr>
				<td colspan="5" align="center">
					<h3>등록된 게시글이 없습니다</h3>
				</td>
			</tr>
		</table>

			<div style="margin-left:1343px;">
		<button type="button" class="btn btn-default btn-sm"
			onclick="location.href='index.jsp?main=whatpick/commu_addform.jsp'">
			<span class="glyphicon glyphicon-pencil"></span>글쓰기
		</button>
	</div>
	
	</div>
</body>
</html>