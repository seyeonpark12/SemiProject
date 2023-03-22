<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MovieDao"%>
<%@page import="data.dto.MovieDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<link href="css/mvlist.css" type="text/css" rel="stylesheet">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" />
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

</head>

<%
String search=request.getParameter("search");

MovieDao dao = new MovieDao();

//블럭 < 1 2 3 4 5 >
int totalCount;
int totalPage;//총페이지수
int startPage;//각블럭의 시작페이지
int endPage;//각블럭의 끝페이지
int start;//각페이지의 시작번호
int perPage = 8;//한페이지에 보여질 글의 갯수
int perBlock = 5; //한블럭당 보여지는 페이지
int currentPage;//현재페이지


//총개수
totalCount = dao.getTotalCount_Search(search);


//현재페이지 번호 읽기(단 null일때는 1페이지로둠)
if (request.getParameter("currentPage") == null)
   currentPage = 1;
else
   currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지 개수
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);


//각블럭의 시작페이지.. 현재페이지가 3(s:1, e:5)  6(s:6, e:10)
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;


//총페이지가8 (6~10 ... endpage를 8로 수정해주어야함.)
if (endPage > totalPage)
   endPage = totalPage;


//각페이지에서 불러올 시작번호
start = (currentPage - 1) * perPage;

//각페이지에서 필요한 게시글 가져오기
List<MovieDto> list=dao.getList_Search(search, start, perPage);


%>

<body>
	<div style="padding: 100px;">
		<div style="text-align: center;">
			<b style="display: inline-block; text-align: left; font-size:14px; font-weight:500;">'<%=search %>'를 검색한 결과입니다.</b>
		</div>
		<%
      if(totalCount == 0){%>

		<h3 style="width: 200px; text-align: center; padding-top:100px;">
			<b style="inline-block; text-align:left; font-size:20px; font-weight:500; color:purple;">등록된 영화가 없습니다</b>
		</h3>
		<%}else{%>

		<div class="container">
			<div class="tab-content" style="padding-top: 40px;">
				<div id="all">
					<div>
						<div
							style="display: inline-flex; flex-wrap: wrap; justify-content: center; padding: 0 80px;">
							<%
                  int i = 0;
                  for (MovieDto dto : list) {
                     //이미지
                     String poster = dto.getMovie_poster();
                  %>
							<% %>
							<div style="padding: 10px;">
								<a movie_num="<%=dto.getMovie_num()%>"
									style="cursor: pointer; display: flex; flex-direction: column; align-items: left;"
									class="godetail"> <img src="movie_save/<%=poster%>"
									class="poster"
									onclick="location.href='index.jsp?main=review/review_moviedetail.jsp?movie_num=<%=dto.getMovie_num()%>&movie_genre=all&sort=recent&currentPage=<%=currentPage%>'">
									<span style="text-align: center; margin-top: 5px; width: 100%;"><%=dto.getMovie_subject()%></span>
								</a>
							</div>


							<%
                  if ((i + 1) % 4 == 0) {
                  %>
						</div>
						<div
							style="display: inline-flex; flex-wrap: wrap; justify-content: center; padding: 0 80px;">
							<%
                  }
                  i++;
                  }
                  %>
						</div>
					</div>
				</div>
			</div>

			<!-- 페이징 처리 -->
			<div style="width: 500px; text-align: center;" class="container">
				<ul class="pagination">
					<%
            //이전

            if (startPage > 1) {
            %>
					<li><a
						href="index.jsp?main=movie/movie_search.jsp?search=<%=search%>&currentPage=<%=startPage - 1%>">이전</a>
					</li>
					<%
            }
            for (int pp = startPage; pp <= endPage; pp++) {
            if (pp == currentPage) {
            %>
					<li class="active"><a
						href="index.jsp?main=movie/movie_search.jsp?search=<%=search%>&currentPage=<%=pp%>"><%=pp%></a>
					</li>
					<%
            } else {
            %>

					<li><a
						href="index.jsp?main=movie/movie_search.jsp?search=<%=search%>&currentPage=<%=pp%>"><%=pp%></a>
					</li>
					<%
            }
            }

            //다음
            if (endPage < totalPage) {
            %>
					<li><a
						href="index.jsp?main=movie/movie_search.jsp?search=<%=search%>&currentPage=<%=endPage + 1%>">다음</a>
					</li>
					<%
            }
            %>
				</ul>
			</div>



		</div>
		<%}
   %>
	</div>

</body>
</html>