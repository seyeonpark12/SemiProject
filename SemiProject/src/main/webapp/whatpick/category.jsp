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
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<div style="margin: 30px 30px; width: 800px;">
		<br>
		<h4>
			<b>총 개의 게시글이 있습니다
			</b>
		</h4>
		<table class="table table-bordered">
			<caption>
				<b>스마트 게시판 목록</b>
			</caption>
			<tr>
				<th width="80">번호</th>
				<th width="400">제목</th>
				<th width="120">작성자</th>
				<th width="180">작성일</th>
				<th width="60">조회</th>
			</tr>

			<tr>
				<td colspan="5" align="center">
					<h3>등록된 게시글이 없습니다</h3>
				</td>
			</tr>

			<tr>
				<td align="center"><input type="checkbox" class="alldel"
					value=""> &nbsp;&nbsp;</td>

					<a
					href="index.jsp?main=board/detailview.jsp?num=&currentPage="
					style="color: red;">
				</a></td>
				<td align="center">글쓴이</td>
				<td>글쓴날</td>
				<td>조회수</td>
			</tr>


			<tr>
				<td colspan="5"><input type="checkbox" class="alldelcheck">전체선택
					<span style="float: right;">
						<button type="button" class="btn btn-danger btn-sm" id="btndel">
							<span class="glyphicon glyphicon-remove"></span>삭제
						</button> &nbsp;
						<button type="button" class="btn btn-success btn-sm"
							onclick="location.href='index.jsp?main=board/smartform.jsp'">
							<span class="glyphicon glyphicon-pencil"></span>글쓰기
						</button>
				</span></td>
			</tr>

		</table>
	</div>


</body>
</html>