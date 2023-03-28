<%@page import="data.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dao.UserDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layoutimage/x-icon" href="../layout_image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="css/info.css" type="text/css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,
	.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover
	{
	z-index: 3;
	color: #fff;
	cursor: default;
	background-color: #CBB6D9;
	border-color: #CBB6D9;
}

.pagination>li>a, .pagination>li>a, .pagination>li>span, .pagination>li>span
	{
	z-index: 2;
	color: #CBB6D9;
	background-color: #fff;
	border: 0px solid;
}

.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus,
	.pagination>li>span:hover {
	z-index: 2;
	color: #fff;
	background-color: #ECE6FF;
	border: 0px solid;
}
</style>


<%
String loginok = (String) session.getAttribute("loginok");
String myid = (String) session.getAttribute("myid");

UserDao dao = new UserDao();
String user_num = request.getParameter("user_num");

ReviewDao rdao = new ReviewDao();
String review_num = request.getParameter("review_num");
String movie_num = request.getParameter("movie_num");

//페이징처리
int totalCount; //내가 쓴 글 총 갯수
int totalPage; //총 페이지 수
int startPage; //각 블럭의 시작 페이지
int endPage; //각 블럭의 끝 페이지
int start; //각 페이지의 시작번호
int perPage = 8; //한 페이지에 보여질 글의 갯수 (5개)
int perBlock = 5; //보여질 블럭의 갯수 (5개)
int currentPage; //현재 페이지

totalCount = rdao.myReviewCount(user_num);

//현재 페이지 번호 읽기
if (request.getParameter("currentPage") == null)
	currentPage = 1;
else
	currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지 갯수
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

//각 블럭의 시작 페이지 
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;

if (endPage > totalPage)
	endPage = totalPage;

//각 페이지에서 불러 올 시작번호
start = (currentPage - 1) * perPage;

List<ReviewDto> list = rdao.getMyReview(user_num, start, perPage);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
%>

<!-- 리뷰 삭제 체크 박스 -->
<script type="text/javascript">
	$(function() {

		$(".allcheckdelete").click(function() {

			var mycheck = $(this).is(":checked");

			$(".checkdelete").prop("checked", mycheck);

		});

		$("#myreviewdelete")
				.click(
						function() {

							var len = $(".checkdelete:checked").length;

							if (len == 0) {
								alert("한 개 이상의 글을 선택해 주세요");
							} else {

								var a = confirm(len + "개의 리뷰를 삭제하시겠습니까?");

								//체크된 글의 value를 review_n 
								var review_n = "";
								var user_num = $(".checkdelete").attr(
										"user_num");

								$(".checkdelete:checked").each(function(idx) {

									review_n += $(this).val() + ",";

								});

								review_n = review_n.substring(0,
										review_n.length - 1);

								if (a == 1) {

									location.href = "mypage/mypage_myreview_delete.jsp?nums="
											+ review_n
											+ "&user_num="
											+ user_num;
									//nums는 값이 누적되고 마지막 컴마가 제거된 review_n

								}
							}
						});

	});
</script>
</head>
<body>
	<div class="myinfo_div">
		<table style="width: 1000px;">
			<%-- <input type="hidden" name="user_num" id="user_num" value="<%=user_num %>">
		<input type="hidden" name="review_num" value="<%=review_num %>">
		<input type="hidden" name="movie_num" value="<%=movie_num %>"> --%>
			<h3>
				내가 쓴 리뷰 <b style="color: purple; font-size: 17pt"><%=totalCount%></b>
			</h3>
			<tr class="tr_myinfo">
				<th width="30" class="myinfo"><input type="checkbox" class="allcheckdelete"></th>
				<th width="200" class="myinfo">영화제목</th>
				<th width="50" class="myinfo">별점</th>
				<th width="550" class="myinfo">리뷰</th>
				<th width="170" class="myinfo">날짜</th>
			</tr>

			<%
			if (totalCount == 0) {
			%>
			<tr>
				<td colspan="5" align="center" class="myinfo">
					<h3>등록된 게시글이 없습니다</h3>
				</td>
			</tr>
			<%
			} else {

			for (ReviewDto rdto : list) {
			%>

			<tr>
				<td align="center" class="myinfo">
					<input type="checkbox" class="checkdelete" user_num="<%=user_num%>" value="<%=rdto.getReview_num()%>">
				</td>
				<%
				String movie_subject = rdao.getMovieSubject(rdto.getMovie_num());
				%>
				<td align="center" class="myinfo">
					<span><%=movie_subject%></span>
				</td>

				<td align="center" class="myinfo">
					<span><%=rdto.getReview_score()%></span>
				</td>

				<td align="center" class="myinfo">
					<span><a href="index.jsp?main=review/review_moviedetail.jsp?movie_genre=all&sort=recent&movie_num=<%=rdto.getMovie_num()%>&currentPage=1"><%=rdto.getReview_content()%></a></span>
				</td>


				<td align="center" class="myinfo">
					<span><%=sdf.format(rdto.getReview_writeday())%></span>
				</td>
			</tr>

			<%
			}
			}
			%>
		</table>
		<div>
			<button type="button" class="btn btn-default btn-sm" onclick="location.href='index.jsp?main=mypage/mypage_form.jsp?user_num=<%=user_num%>'" style="margin-left: 850px; margin-bottom: 10px;">마이페이지</button>

			<button type="button" class="btn btn-default btn-sm" id="myreviewdelete" style="color: red; border: 1px solid red; margin-bottom: 10px;">삭제</button>
		</div>
	</div>

	<!-- 페이징처리 -->
	<div style="width: 500px; text-align: center;" class="container">
		<ul class="pagination">
			<%
			//이전
			if (startPage > 1) {
			%>
			<li>
				<a href="index.jsp?main=mypage/login_mypage_myreview.jsp?currentPage=<%=startPage - 1%>&user_num=<%=user_num%>">이전</a>
			</li>
			<%
			}

			for (int pp = startPage; pp <= endPage; pp++) {

			if (pp == currentPage) {
			%>
			<li class="active">
				<a href="index.jsp?main=mypage/login_mypage_myreview.jsp?currentPage=<%=pp%>&user_num=<%=user_num%>"><%=pp%></a>
			</li>
			<%
			} else {
			%>
			<li>
				<a href="index.jsp?main=mypage/login_mypage_myreview.jsp?currentPage=<%=pp%>&user_num=<%=user_num%>"><%=pp%></a>
			</li>
			<%
			}

			}

			//다음
			if (endPage < totalPage) {
			%>
			<li>
				<a href="index.jsp?main=mypage/login_mypage_myreview.jsp?currentPage=<%=endPage + 1%>&user_num=<%=user_num%>">다음</a>
			</li>
			<%
			}
			%>
		</ul>
	</div>
</body>
</html>