<%@page import="data.dao.PickDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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

<link href="css/info.css" type="text/css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("span.camera").click(function() {
			$("#movie_poster").trigger("click"); //이벤트 강제호출 : trigger
		});
		// 리뷰 생성
		$("#review_save").click(function() {
			var movie_num = $("#movie_num").val();
			var user_num = $("#user_num").val();
			var review_score = $("#myform input[type=radio]:checked").val()
			var review_contents = $("#review_contents").val();

			//alert(movie_num + "," + user_num + "," + review_score + "," + review_contents);

			$.ajax({
				type : "get",
				url : "review/review_addaction.jsp",
				dataType : "html",
				data : {
					"movie_num" : movie_num,
					"user_num" : user_num,
					"review_score" : review_score,
					"review_content" : review_contents
				},
				success : function() {
					alert("리뷰 등록 완료");
					location.reload();

				}
			})

		})
		// 리뷰 삭제
		$(".review_del").click(function() {
			var review_num = $(this).attr("review_num")
			//alert(review_num)

			$.ajax({
				type : "get",
				dataType : "html",
				url : "review/review_delete.jsp",
				data : {
					"review_num" : review_num
				},
				success : function() {
					alert("삭제되었습니다")
					location.reload();
				}
			})
		})
		// pick 추가
		$("#movie_pickadd").click(function() {
			var movie_num = $("#movie_num").val();
			var user_num = $("#user_num").val();
			var tag = $(this);

			//alert(movie_num+"번 영화, "+user_num+"번 유저");
			$.ajax({
				type : "get",
				dataType : "html",
				url : "review/pick_addaction.jsp",
				data : {
					"movie_num" : movie_num,
					"user_num" : user_num
				},
				success : function() {
					alert("pick 되었습니다")
					location.reload();
				}

			});
		});
		// pick 제거
		$("#movie_pickdel").click(function() {
			var movie_num = $("#movie_num").val();
			var user_num = $("#user_num").val();

			//alert(movie_num+"번 영화, "+user_num+"번 유저");
			$.ajax({
				type : "get",
				dataType : "html",
				url : "review/pick_delete.jsp",
				data : {
					"movie_num" : movie_num,
					"user_num" : user_num
				},
				success : function() {
					alert("pick이 해제되었습니다")
					location.reload();
				}

			});
		});
		// 영화 삭제
		$("#movie_delete")
				.click(
						function() {
							var movie_num = $(this).attr("movie_num");
							//alert(movie_num);

							$
									.ajax({
										type : "get",
										dataType : "html",
										url : "movie/movie_delete.jsp",
										data : {
											"movie_num" : movie_num
										},
										success : function() {
											alert("삭제성공!")

											location.href = "index.jsp?main=movie/movie_list.jsp?movie_genre=all&sort=recent&currentPage=1";
										}
									});
						})
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
.review_del {
	width: 30px;
}

.shape {
	position: relative;
	font-size: 50pt;
	top: 50px;
	left: 100px;
}

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
	position: relative;
	font-size: 14px;
	font-weight: 400;
	letter-spacing: -0.7px;
	line-height: 22px;
	top: 30px;
}

.mv_content_es {
	position: relative;
	font-size: 14px;
	font-weight: 400;
	letter-spacing: -0.7px;
	line-height: 22px;
	top: 28px;
	cursor: pointer;
}

td {
	margin-bottom: 100px;
}

#myform {
	height: 300px;
}

#myform fieldset {
	display: inline-block;
	padding-left: 80px;
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

#review_contents {
	width: 100%;
	height: 300px;
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
UserDao udao = new UserDao();
UserDto udto = new UserDto();
ReviewDao rdao = new ReviewDao();
PickDao pdao = new PickDao();
String movie_num = request.getParameter("movie_num");
MovieDto mdto = mdao.getData(movie_num);

String poster = mdto.getMovie_poster();
String loginok = (String) session.getAttribute("loginok");

String myid = (String) session.getAttribute("myid");
String user_nickname = udao.getName_id(myid);

String user_num = udao.getNum(myid);
double review_avgscore = rdao.review_ScoreAvg(movie_num);

rdao.insertMovie_Rank_Avg(review_avgscore, movie_num);

String currentPage = request.getParameter("currentPage");

//장르
String movie_genre = request.getParameter("movie_genre");

//정렬
String sort = request.getParameter("sort");

int totalCount;
int totalPage; //총 페이지수
int startPage; //각블럭의 시작페이지
int endPage; //각 블럭의 마지막페이지
int start; //각페이지 시작번호
int perPage = 5; //현재 페이지 보여질 글의 갯수
int perBlock = 5; //한 블럭당 보여지는 페이지개수
int currentPage_review; //현재페이지
int no;

//총갯수
totalCount = rdao.getTotalReviewCount(movie_num);

//현재 페이지번호 읽기
if (request.getParameter("currentPage_review") == null)
	currentPage_review = 1;
else
	currentPage_review = Integer.parseInt(request.getParameter("currentPage_review"));

//총 페이지 갯수
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

//각 블럭의 시작페이지
startPage = (currentPage_review - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;

//총페이지가 8... (6-10... endpage를 8로 수정)
if (endPage > totalPage)
	endPage = totalPage;

//각페이지에서 불러올 시작번호
start = (currentPage_review - 1) * perPage;

//각 페이지 에서 필요한 게시글 가져오기
List<ReviewDto> list = rdao.getAllReview(start, perPage);
List<ReviewDto> list_movie = rdao.getAllReview_movie(movie_num, start, perPage);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

no = totalCount - (currentPage_review - 1) * perPage;
%>
<body>
	<div style="margin-top: 100px; padding: 0;">
		<input type="hidden" id="movie_num" value="<%=movie_num%>">
		<input type="hidden" id="myid" value="<%=myid%>">
		<input type="hidden" id="user_num" value="<%=user_num%>">
		<input type="hidden" id="user_nickname" value="<%=user_nickname%>">

		<!-- Modal -->
		<div class="review_modal modal fade" id="modal" role="dialog">
			<div class="review_modal modal-dialog">

				<!-- Modal content-->
				<div class="review_modal modal-content" style="margin-top: 170px;">
					<div class="review_modal modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<img alt="" src="movie_save/<%=poster%>" movie_num="<%=movie_num%>" width="200">
						<div style="text-align: center; font-size: 20pt">
							<b style="font-size: 15pt;">
								&nbsp;&nbsp;&nbsp;<%=mdto.getMovie_subject()%></b>
						</div>
					</div>
					<div class="review_modal modal-score">

						<form class="mb-3" name="myform" id="myform" method="post">
							<fieldset>
								<input type="radio" name="review_Star" value="5" id="rate1">
								<label for="rate1">★</label>
								<input type="radio" name="review_Star" value="4" id="rate2">
								<label for="rate2">★</label>
								<input type="radio" name="review_Star" value="3" id="rate3">
								<label for="rate3">★</label>
								<input type="radio" name="review_Star" value="2" id="rate4">
								<label for="rate4">★</label>
								<input type="radio" name="review_Star" value="1" id="rate5">
								<label for="rate5">★</label>
							</fieldset>
							<div>
								<textarea class="col-auto form-control" id="review_contents" placeholder="욕설과 비방을 작성 시 제재를 당할 수 있습니다." required="required"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" id="review_save">저장하기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal 끝-->

		<table style="width: 1000px;">
			<tr height="100">
				<td rowspan="3" width="300">
					<!-- 영화이미지 보이는 이미지 --> <img src="movie_save/<%=poster%>" movie_num="<%=movie_num%>" id="movie_poster" style="max-width: 200px;">
				</td>

				<td width="600"><b class="mv_subject"><%=mdto.getMovie_subject()%></b></td>
			</tr>

			<tr>
				<td><b class="mv_content_year"><%=mdto.getMovie_year()%>
						|
						<%=mdto.getMovie_genre()%>
						|
						<%=mdto.getMovie_nara()%></b></td>
			</tr>

			<tr>
				<td><b class="mv_content" style="color: orange;">
						★
						<%=review_avgscore%></b></td>
				<%
				if (loginok != null) {
				%>
				<%
				if (myid.equals("admin")) {
				%>

				<td>
					<button type="button" onclick="location.href='index.jsp?main=movie/movie_updateform.jsp?movie_num=<%=movie_num%>'">영화수정</button>
					<button type="button" id="movie_delete" movie_num="<%=movie_num%>">영화삭제</button>
				</td>
				<%
				}
				%>
				<%
				if (pdao.isCheck(user_num, movie_num) == false) {
				%>
				<td><b id="movie_pickadd" movie_num="<%=movie_num%>" class="mv_content" style="margin-left: -100px; cursor: pointer;">PICK</b></td>
				<%
				} else {
				%>
				<td><b id="movie_pickdel" movie_num="<%=movie_num%>" class="mv_content" style="margin-left: -100px; cursor: pointer;">NOT PICK</b></td>
				<%
				}
				%>
				<td><b data-toggle="modal" data-target="#modal" class="mv_content_es">리뷰하기</b></td>
				<%
				}
				%>
			</tr>
		</table>

		<hr>

		<div style="width: 1000px; padding: 0;">
			<h3>기본정보</h3>
			<div style="width: 1000px; border: 1px solid gray; margin-left: 1px; padding: 30px;" id="movie_content"><%=mdto.getMovie_content()%></div>

			<h3>출연/제작</h3>
			<div style="width: 1000px; border: 1px solid gray; margin-left: 1px; padding: 30px;" id="movie_content"><%=mdto.getMovie_actor()%>
				/
				<%=mdto.getMovie_director()%></div>

			<h3>예고편</h3>
			<div style="width: 1000px; border: 1px solid gray; margin-left: 1px; padding: 30px;" id="movie_content">
				<iframe width="900" height="506" src="<%=mdto.getMovie_play()%>" title="<%=mdto.getMovie_subject()%>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen> </iframe>
			</div>

			<h3>리뷰</h3>
			<div style="width: 1000px; margin-left: 1px;" id="movie_content">
				<table style="width: 1000px; height: 200px;">
					<tr>
						<th width="80" height="50" class="myinfo" style="text-align: center;">번호</th>
						<th width="400" class="myinfo" style="text-align: center;">내용</th>
						<th width="120" class="myinfo" style="text-align: center;">작성자</th>
						<th width="70" class="myinfo" style="text-align: center;">점수</th>
						<th width="330" class="myinfo" style="text-align: center;">작성일</th>
						<th width="100"></th>
					</tr>

					<%
					if (totalCount == 0) {
					%>
					<tr>
						<td colspan="5" align="center">
							<h3>등록된 게시글이 없습니다</h3>
						</td>
					</tr>
					<%
					} else {
					for (ReviewDto rdto : list_movie) {
					%>

					<%
					String writer_nickname = udao.getName_num(rdto.getUser_num());
					%>

					<tr>
						<td align="center"><%=no--%></td>
						<td><%=rdto.getReview_content()%></td>
						<td align="center"><%=writer_nickname%></td>
						<td width="30" style="text-align: center; color: orange;"><%="★ " + Math.round(rdto.getReview_score())%></td>
						<td width="300" style="text-align: center;"><%=sdf.format(rdto.getReview_writeday())%></td>
						<%
						if (loginok != null && rdto.getUser_num().equals(user_num) ||loginok != null && myid.equals("admin")) {
						%>
						<td width="200" align="center"><button class="review_del" review_num=<%=rdto.getReview_num()%>>삭제</button></td>
						<%
						}
						%>
					</tr>
					<%
					}
					}
					%>

				</table>
			</div>


			<!-- 페이징 처리 -->
			<div style="width: 800px; text-align: center;">
				<ul class="pagination">
					<%
					//이전
					if (startPage > 1) {
					%>
					<li><a href="index.jsp?main=review/review_moviedetail.jsp?movie_genre=<%=movie_genre%>&movie_num=<%=movie_num%>&currentPage=<%=currentPage%>&currentPage_reviewe=<%=startPage - 1%>">이전</a></li>
					<%
					}

					for (int pp = startPage; pp <= endPage; pp++) {

					if (pp == currentPage_review) {
					%>
					<li class="active"><a href="index.jsp?main=review/review_moviedetail.jsp?movie_genre=<%=movie_genre%>&movie_num=<%=movie_num%>&currentPage=<%=currentPage%>&currentPage_review=<%=pp%>"><%=pp%></a></li>
					<%
					} else {
					%>
					<li><a href="index.jsp?main=review/review_moviedetail.jsp?movie_genre=<%=movie_genre%>&movie_num=<%=movie_num%>&currentPage=<%=currentPage%>&currentPage_review=<%=pp%>"><%=pp%></a></li>
					<%
					}

					}

					//다음
					if (endPage < totalPage) {
					%>
					<li><a href="index.jsp?main=review/review_moviedetail.jsp?movie_genre=<%=movie_genre%>&movie_num=<%=movie_num%>&currentPage=<%=currentPage%>&currentPage_review=<%=endPage + 1%>">다음</a></li>
					<%
					}
					%>
				</ul>

				<button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=movie/movie_list.jsp?movie_genre=all&sort=recent&currentPage=1'">목록</button>
			</div>

		</div>
	</div>

</body>

</html>