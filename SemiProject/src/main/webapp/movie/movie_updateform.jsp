<%@page import="data.dto.MovieDto"%>
<%@page import="data.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layoutimage/x-icon" href="../layout_image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="css/movie.css" type="text/css" rel="stylesheet">
<link href="css/info.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
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

<%
String movie_num = request.getParameter("movie_num");

MovieDao dao = new MovieDao();
MovieDto dto = dao.getData(movie_num);
%>
</head>
<body>
	<div style="margin-top: 100px; padding: 0;">
		<form action="movie/movie_updateaction.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="movie_num" value="<%=movie_num%>">
			<input type="hidden" name="before_poster" value="<%=dto.getMovie_poster()%>">



			<div style="text-align: center; padding: 40px;">
				<b class="mv_content" style="display: inline-block; text-align: left; font-size: 14px; font-weight: 500;">영화 수정
					<hr style="border: 1px solid purple;">
				</b>
			</div>


			<table style="width: 1000px; float: left; margin-left: 300px;">
				<tr>
					<td width="30%">
						<a style="display: inline-block; width: 100%; height: 390px; padding: 10px; overflow: hidden; border-radious: 10px;"> <img id="showimg" src="movie_save/<%=dto.getMovie_poster()%>" class="posterimg" style="width: 100%; border-radious: 10px;">
						</a> <b class="mv_content" style="margin-left: 115px;">영화포스터</b> <span class="glyphicon glyphicon-camera camera"></span>
						<input type="file" name="movie_poster" id="movie_poster" style="visibility: hidden;" onchange="readURL(this)">
					</td>

					<td style="padding-top: 50px; padding-left: 25px;">
						<input type="text" name="movie_subject" required="required" id="movie_subject" class="form-control" placeholder="영화제목" style="margin-bottom: 10px;" value="<%=dto.getMovie_subject()%>">



						<input type="date" name="movie_year" id="movie_year" required="required" class="form-control" value="<%=dto.getMovie_year()%>" style="margin-bottom: 10px;">



						<select name="movie_genre" class="form-control" required="required" style="margin-bottom: 10px;">
							<option value="romance" <%=dto.getMovie_genre().equals("romance") ? "selected" : ""%>>로맨스</option>
							<option value="action" <%=dto.getMovie_genre().equals("action") ? "selected" : ""%>>액션</option>
							<option value="comedy" <%=dto.getMovie_genre().equals("comedy") ? "selected" : ""%>>코미디</option>
							<option value="horror" <%=dto.getMovie_genre().equals("horror") ? "selected" : ""%>>공포</option>
							<option value="animation" <%=dto.getMovie_genre().equals("animation") ? "selected" : ""%>>애니메이션</option>
							<option value="etc" <%=dto.getMovie_genre().equals("etc") ? "selected" : ""%>>기타</option>
						</select>

						<input type="text" name="movie_nara" id="movie_nara" required="required" class="form-control" placeholder="국가" style="margin-bottom: 10px;" value="<%=dto.getMovie_nara()%>">

						<input type="text" name="movie_director" id="movie_director" class="form-control" required="required" placeholder="감독" style="margin-bottom: 10px;" value="<%=dto.getMovie_director()%>">

						<input type="text" name="movie_actor" id="movie_actor" class="form-control" required="required" placeholder="출연진" style="margin-bottom: 10px;" value="<%=dto.getMovie_actor()%>">

						<input type="text" name="movie_play" id="movie_play" class="form-control" required="required" placeholder="유튜브 트레일러(링크)" style="margin-bottom: 10px;" value="<%=dto.getMovie_play()%>">
					</td>
				</tr>
			</table>

			<div class="write" style="align: center; margin: 0 300px;">
				<textarea style="width: 1000px; height: 400px; padding: 30px; margin-top: -60px; border: 1px solid lightgray;" name="movie_content" required="required" id="movie_comtent"><%=dto.getMovie_content()%></textarea>
			</div>



			<button type="submit" class="btn btn-default btn-ls" style="float: right; margin-top: 10px; margin-right: 700px;">영화수정</button>


		</form>
	</div>

</body>
</html>