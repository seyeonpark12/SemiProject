<%@page import="data.dto.ReviewDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layout_image/x-icon" href="../layout_image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
<body>
	<div style="margin: 30px 30px; width: 800px;">
		<br>
		<table class="table table-bordered">
			<caption>
				<b>리뷰 목록</b>
			</caption>
			<tr>
				<th width="80" style="text-align: center;">번호</th>
				<th width="400" style="text-align: center;">내용</th>
				<th width="120" style="text-align: center;">작성자</th>
				<th width="70" style="text-align: center;">점수</th>
				<th width="60" style="text-align: center;">작성일</th>
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
			for (ReviewDto dto : list) {
			%>
			<tr>
				<td align="center"><input type="checkbox" class="alldel" value="<%=dto.getMovie_num()%>"> &nbsp;&nbsp; <%=no--%></td>
				<td ><a href="index.jsp?main=board/detailview.jsp?num=<%=dto.getMovie_num()%>&currentPage=<%=currentPage%>"><%=dto.getReview_content()%></a> <%

 %></td>
				<td align="center"><%=dto.getUser_num()%></td>
				<td width="30" style="text-align: center;"><%=dto.getReview_score()%></td>
				<td width="200" style="text-align: center;"><%=sdf.format(dto.getReview_writeday())%></td>
			</tr>
			<%
			}
			}
			%>

			<tr>
				<td colspan="5"><input type="checkbox" class="alldelcheck"> 전체선택 <span style="float: right;">

						&nbsp;
						<button type="button" class="btn btn-success btn-sm" onclick="location.href='index.jsp?main=review/reviewinsertform.jsp'">
							<span class="glyphicon glyphicon-pencil"></span>
							글쓰기
						</button>
					</span></td>
			</tr>

		</table>
	</div>


	<!-- 페이징 처리 -->
	<div style="width: 800px; text-align: center;">
		<ul class="pagination">
			<%
			//이전
			if (startPage > 1) {
			%>
			<li><a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage - 1%>">이전</a></li>
			<%
			}

			for (int pp = startPage; pp <= endPage; pp++) {

			if (pp == currentPage) {
			%>
			<li class="active"><a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
			<%
			} else {
			%>
			<li><a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
			<%
			}

			}

			//다음
			if (endPage < totalPage) {
			%>
			<li><a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage + 1%>">다음</a></li>
			<%
			}
			%>
		</ul>
	</div>

</body>


</html>