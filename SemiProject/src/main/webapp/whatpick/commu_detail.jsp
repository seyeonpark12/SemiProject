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
<link rel="shortcut icon" type="../layoutimage/x-icon" href="../layout_image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    
<style type="text/css">


*{
	margin: 0 auto;
	padding: 0;
	list-style: none;
	font-family:"Noto Sans KR";
	color: black;
}

.ca_subject {
	font-size: 15px;
	font-weight: 400;
	letter-spacing: -1.2px;
	line-height: 36px;
}

</style>

</head>

<body>
	<%
	//String category=request.getParameter("commu_category");
	String category="자유";
	%>
		<br>
		<br>
	<div style="margin: 30px 30px; margin-left: 450px;">
		<form action="commu/commu_addaction.jsp" method="post"
			enctype="multipart/form-data">
			<table style="width: 1000px; margin-left:0px;">
				<tr>
					<td width="1000">
						<b class="ca_subject">카테고리(dto값)</b>
						<b class="ca_subject" style="margin-left: 100px;">제목(dto값)</b>
					</td>
				</tr>

				<tr>
					<td width="1000">
						<b class="ca_subject">작성날짜(dto값)</b>
						<b class="ca_subject" style="margin-left: 100px;">작성자(dto값)</b>
						<b class="ca_subject" style="margin-left: 600px;">조회수(dto값)</b></td>
				</tr>
				
			</table>
		</form>
		<br>

		<div style="width: 1000px; border: 1px solid gray; margin-left: 0px; margin-bottom:30px; padding: 30px;" id="movie_comtent">컨테츠 값 불러오기</div>
			<div style="margin-left:840px;">
		<button type="submit" class="btn btn-default">수정</button>
		<button type="submit" class="btn btn-default">삭제</button>
		<button type="button" class="btn btn-default"
			onclick="location.href='index.jsp?main=whatpick/category.jsp'">목록</button>
			</div>
		<h3>댓글</h3>
		<div
			style="width: 1000px; border: 1px solid gray; margin-left: 1px; padding: 30px;"
			id="movie_comtent">댓글 불러오기</div>

	</div>

</body>
</html>