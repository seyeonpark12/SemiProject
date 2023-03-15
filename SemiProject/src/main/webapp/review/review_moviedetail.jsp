<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="data.dto.MovieDto"%>
<%@page import="data.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layoutimage/x-icon" href="../layout_image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<!-- <link href="css/index.css" type="text/css" rel="stylesheet"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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


<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
	list-style: none;
	font-family: "Noto Sans KR";
	color: black;
}

.mv_subject {
	font-size: 22px;
	font-weight: 700;
	letter-spacing: -1.2px;
	line-height: 41px;
}

.mv_content {
	font-size: 14px;
	font-weight: 400;
	letter-spacing: -0.7px;
	line-height: 22px;
	margin-top: 4px;
	margin-bottom: 10px;
}

a {
	color: black;
}

td {
	margin-bottom: 100px;
}

#myform fieldset {
	display: inline-block;
	padding-left: 180px;
	border: 0;
	direction: rtl;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}
/*버튼 올렸을 때 별*/
#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
/* 버튼 올렸을 때까지의 별 채움  */
#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
/* 별을 클릭했을 때  */
#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 100%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}
</style>

</head>
<%
MovieDao mdao = new MovieDao();
String movie_num = request.getParameter("movie_num");
String user_nickname = request.getParameter("user_nickname");
String review_content = request.getParameter("review_content");
MovieDto mdto = mdao.getData(movie_num);
ReviewDao rdao = new ReviewDao();

String poster = mdto.getMovie_poster();
%>
<body>
	<div style="margin-top: 100px; padding: 0;">
		<input type="hidden" id="movie_num" value="<%=movie_num%>">
		<form action="movie_addaction.jsp" method="post" enctype="multipart/form-data">
			<table style="width: 1000px;">
				<tr height="100">
					<td rowspan="4" width="300">
						<!-- 영화이미지 보이는 이미지 --> <img src="../movie_save/<%=poster%>" movie_num="<%=movie_num%>" id="movie_poster" style="max-width: 200px;">

					</td>

					<td width="600"><b class="mv_subject"><%=mdto.getMovie_subject()%></b></td>
				</tr>

				<tr>
					<td><b class="mv_content"><%=mdto.getMovie_year()%>
							|
							<%=mdto.getMovie_genre()%>
							|
							<%=mdto.getMovie_nara()%></b></td>
				</tr>

				<tr>
					<td><b class="mv_content"> 평균☆ 별점 값..</b></td>
					<td><b class="mv_content" style="margin-left: -100px;">
							찜♡

							<input type="hidden" id="user_nickname" value="<%=user_nickname%>">
							<a data-toggle="modal" data-target="#myModal"> 평가하기 </a>
						</b> <!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<img alt="" src="../movie_save/<%=poster%>" movie_num="<%=movie_num%>" width="200" height="200">
										&nbsp;&nbsp;&nbsp;영화 제목
									</div>
									<div class="modal-score">

										<form action="review_addaction.jsp" class="mb-3" name="myform" id="myform" method="post">
											<fieldset>
												<input type="radio" name="review_Star" value="1" id="rate1">
												<label for="rate1">★</label>
												<input type="radio" name="review_Star" value="2" id="rate2">
												<label for="rate2">★</label>
												<input type="radio" name="review_Star" value="3" id="rate3">
												<label for="rate3">★</label>
												<input type="radio" name="review_Star" value="4" id="rate4">
												<label for="rate4">★</label>
												<input type="radio" name="review_Star" value="5" id="rate5">
												<label for="rate5">★</label>
											</fieldset>
											<div>
												<textarea class="col-auto form-control" type="text" id="review_contents" placeholder="욕설과 비방을 작성 시 강퇴당할 수 있습니다." required="required"></textarea>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='review_listform.jsp'" id="review_save">저장하기</button>
									</div>
								</div>
							</div>

						</div></td>
				</tr>
			</table>

			<hr>
			<br> <br>
			<div class="write" style="align: center; margin-left: 500px;">
				<h3>기본정보</h3>
				<br>
				<div style="width: 1000px; border: 1px solid gray; margin-left: 1px; padding: 30px;" id="movie_content"><%=mdto.getMovie_content()%></div>
			</div>

			<div style="margin-left: 500px; width: 1000px; height: 100px; padding: 0;">
				<h3>출연/제작</h3>
				<div style="width: 1000px; border: 1px solid gray; margin-left: 1px; padding: 30px;" id="movie_content"><%=mdto.getMovie_actor()%>
					/
					<%=mdto.getMovie_director()%></div>


				<h3>예고편</h3>
				<div style="width: 1000px; border: 1px solid gray; margin-left: 1px; padding: 30px;" id="movie_content">예고편 유튜브값 불러오기</div>

				<h3>리뷰</h3>
				<div style="width: 1000px; border: 1px solid gray; margin-left: 1px; padding: 30px;" id="movie_content">리뷰값 불러오기</div>

			</div>
		</form>

		<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
	</div>
</body>

</html>