<%@page import="data.dao.ReviewDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layoutimage/x-icon" href="../layout_image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(function() {
		$("span.camera").click(function() {
			$("#movie_poster").trigger("click"); //이벤트 강제호출 : trigger
		});
	});

	//이미지미리보기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#showimg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<%
ReviewDao dao = new ReviewDao();

int totalCount;
int totalPage; //총 페이지수
int startPage; //각블럭의 시작페이지
int endPage; //각 블럭의 마지막페이지
int start; //각페이지 시작번호
int perPage = 3; //현제페이지 보여질 글의 갯수
int perBlock = 5; //한블럭당 보여지는 페이지개수
int currentPage; //현재페이지
int no;

//총갯수
totalCount = dao.getTotalReviewCount();

//현재 페이지번호 읽기
if (request.getParameter("currentPage") == null)
	currentPage = 1;
else
	currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지 갯수
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

//각 블럭의 시작페이지
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;

//총페이지가 8... (6-10... endpage를 8로 수정)
if (endPage > totalPage)
	endPage = totalPage;

//각페이지에서 불러올 시작번호
start = (currentPage - 1) * perPage;

//각 페이지 에서 필요한 게시글 가져오기
List<ReviewDto> list = dao.getAllReview(start, perPage);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

no = totalCount - (currentPage - 1) * perPage;
%>
<body>
	<div style="margin-left: 100px; margin-top: 100px; padding: 0;">
		<form action="movie/movieaddaction.jsp" method="post" enctype="multipart/form-data">
			<table style="width: 500px;">
				<caption>
					<b>영화포스터</b>
					<span class="glyphicon glyphicon-camera camera"></span>
					<input type="file" name="movie_poster" id="movie_poster" style="visibility: hidden;" onchange="readURL(this)">
				</caption>

				<tr height="100">
					<td rowspan="4" width="200">
						<!-- 이미지 미리보기 할 위치 --> <img id="showimg" src="" style="max-width: 200px;">
					</td>
					<td><b>영화 제목</b></td>
					<td><input type="text" name="movie_subject" id="movie_subject"></td>
				</tr>

				<tr>
					<td><b>개봉연도</b></td>

					<td><input type="date" name="movie_year" id="movie_year" value="2023-01-01"></td>
				</tr>

				<tr>
					<td><b>영화장르</b></td>

					<td><select name="movie_genre">
							<option value="로맨스">로맨스</option>
							<option value="액션">액션</option>
							<option value="코미디">코미디</option>
							<option value="공포">공포</option>
							<option value="애니메이션">애니메이션</option>
							<option value="기타">기타</option>
					</select></td>
				</tr>

				<tr>
					<td><b>국가</b></td>

					<td><input type="text" name="movie_nara" id="movie_nara"></td>
				</tr>
			</table>
		</form>
	</div>

	<div style="margin-left: 100px;">
		<h3>줄거리</h3>
		<br>
		<textarea style="width: 500px; height: 200px;" name="movie_content" id="movie_comtent"></textarea>
	</div>

	<div style="margin-left: 100px; width: 500px; height: 100px; padding: 0;">
		<h4>출연/제작</h4>
		<div style="border: 1px solid gray">
			<b>감독</b>
			<br> <input type="text" name="movie_director" id="movie_director"> <br>
			<b>출연진</b>
			<br> <input type="text" name="movie_actor" id="movie_actor" style="width: 200px;"> <br>
		</div>
	</div>
	<br>
	<br>
	<br>
	<button type="submit" class="btn btn-info btn-ls" style="margin-left: 300px;">영화등록</button>
	

</body>
</html>