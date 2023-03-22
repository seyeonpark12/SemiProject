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
<link href="css/main.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" />


<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
   $(function() {

      $("#moviedel").click(function() {

         var cnt = $(".movie_num:checked").length;
         if (cnt == 0) {

            alert("삭제할 영화를 선택해주세요");
            return;
         }

         $(".movie_num:checked").each(function(i, element) {

            var movie_num = $(this).attr("movie_num");
            $.ajax({
               type : "get",
               dataType : "html",
               url : "movie/movie_delete.jsp",
               data : {
                  "movie_num" : movie_num
               },
               success : function() {

                  location.reload();
               }
            });
         });

      });

       
        $('.nav>li>a').on('click', function() {
           // 다른 li 요소의 배경색을 해제하고 on 클래스를 제거합니다.
           $('.nav>li>a').not(this).removeClass('on').css('background-color', '');
           // 클릭된 요소의 배경색을 purple로 변경하고 on 클래스를 추가합니다.
           $(this).addClass('on').css('background-color', 'purple');
         });
        
   });
</script>

<style type="text/css">
.nav>li>a, .nav>li>a {
   text-decoration: none;
   color: #653491;;
}

.nav>li>a:focus, .nav>li>a:hover {
   text-decoration: none;
   color: #fff;
   background-color: #CBB6D9;
   border: 0px solid;
}

.nav>li>a:active {
   text-decoration: none;
   color: #fff;
   background-color: purple;
   border: 0px solid;
}

.nav>li>a.on, .nav>li>a.on:active {
   text-decoration: none;
   background-color: purple;
}

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
//로그인상태 확인 후 입력폼  나타내기
String loginok = (String) session.getAttribute("loginok");
//id
String myid = (String) session.getAttribute("myid");

String movie_genre = request.getParameter("movie_genre");
String sort = request.getParameter("sort");
MovieDao dao = new MovieDao();

//블럭 < 1 2 3 4 5 >
int totalCount;
int totalCountGen; //장르별 토탈수
int totalPage;//총페이지수
int totalPageGen; //장르별 페이지수
int startPage;//각블럭의 시작페이지
int endPage;//각블럭의 끝페이지
int endPageGen;//장르별 끝페이지
int start;//각페이지의 시작번호
int perPage = 8;//한페이지에 보여질 글의 갯수
int perBlock = 5; //한블럭당 보여지는 페이지
int currentPage;//현재페이지
//int no;

//총개수
totalCount = dao.getTotalCount();
//카테고리별 총개수
totalCountGen = dao.getTotalCount_Genre(movie_genre);

//현재페이지 번호 읽기(단 null일때는 1페이지로둠)
if (request.getParameter("currentPage") == null)
   currentPage = 1;
else
   currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지 개수
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
//카테고리별 페이지 개수
totalPageGen = totalCountGen / perPage + (totalCountGen % perPage == 0 ? 0 : 1);

//각블럭의 시작페이지.. 현재페이지가 3(s:1, e:5)  6(s:6, e:10)
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;
endPageGen = startPage + perBlock - 1;

//총페이지가8 (6~10 ... endpage를 8로 수정해주어야함.)
if (endPage > totalPage)
   endPage = totalPage;
if (endPageGen > totalPageGen)
   endPageGen = totalPageGen;

//각페이지에서 불러올 시작번호
start = (currentPage - 1) * perPage;

//각페이지에서 필요한 게시글 가져오기
List<MovieDto> list_recent = dao.getList_Recent(start, perPage);
List<MovieDto> list_pick = dao.getList_Pcount(start, perPage);
List<MovieDto> list_rank = dao.getList_Rank_Avg(start, perPage);
List<MovieDto> list_genre_recent = dao.getList_Genre_Recent(movie_genre, start, perPage);
List<MovieDto> list_genre_pick = dao.getList_Genre_Pcount(movie_genre, start, perPage);
List<MovieDto> list_genre_rank = dao.getList_Genre_Rank_Avg(movie_genre, start, perPage);
%>

<body>
   <div style="width: 100%; margin-top: 100px;">
      <div class="container">
         <ul class="nav nav-tabs" style="margin-bottom:10px;">
            <li style="margin-left: 330px;"><a class="all_genre"
               href="movie/select_genre_sort.jsp?movie_genre=all&sort=<%=sort%>">전체</a></li>
            <li><a class="romance"
               href="movie/select_genre_sort.jsp?movie_genre=romance&sort=<%=sort%>">로맨스</a></li>
            <li><a class="action"
               href="movie/select_genre_sort.jsp?movie_genre=action&sort=<%=sort%>">액션</a></li>
            <li><a class="comedy"
               href="movie/select_genre_sort.jsp?movie_genre=comedy&sort=<%=sort%>">코미디</a></li>
            <li><a class="horror"
               href="movie/select_genre_sort.jsp?movie_genre=horror&sort=<%=sort%>">공포</a></li>
            <li><a class="animation"
               href="movie/select_genre_sort.jsp?movie_genre=animation&sort=<%=sort%>">애니메이션</a></li>
            <li><a class="everything"
               href="movie/select_genre_sort.jsp?movie_genre=etc&sort=<%=sort%>">기타</a></li>
         </ul>
         
         <div style="float: right;">
            <div style="float: left;">
               <a
                  href="movie/select_genre_sort.jsp?movie_genre=<%=movie_genre%>&sort=recent"
                  style="font-size: 12px; color: #653491; padding-top: 10px; padding-right: 10px;">최신순
                  &nbsp;|</a>
            </div>
            <div style="float: left;">
               <a
                  href="movie/select_genre_sort.jsp?movie_genre=<%=movie_genre%>&sort=rank"
                  style="font-size: 12px; color: #653491; padding-top: 10px; padding-right: 10px;">평점순
                  &nbsp;|</a>
            </div>
            <div style="float: left;">
               <a
                  href="movie/select_genre_sort.jsp?movie_genre=<%=movie_genre%>&sort=pick"
                  style="font-size: 12px; color: #653491; padding-top: 10px; padding-right: 10px;">pick순</a>
            </div>
         </div>
      </div>


      <%
      if (movie_genre.equals("all")) {
      %>


      <div class="tab-content"
         style="padding-top: 40px; margin-left: 170px;">
         <div id="all">
            <div>
               <div
                  style="display: inline-flex; flex-wrap: wrap; justify-content: center; padding: 0 80px;">
                  <%
                  int i = 0;
                  for (MovieDto dto : sort.equals("recent") ? list_recent : sort.equals("pick") ? list_pick : list_rank) {
                     //이미지
                     String poster = dto.getMovie_poster();
                  %>
                  <%

                  %>
                  <div style="padding: 10px;">
                     <%
                     if (loginok != null) {
                        if (myid.equals("admin")) {
                     %>

                     <input type="checkbox" name="movie_num" class="movie_num"
                        movie_num="<%=dto.getMovie_num()%>" id="movie_del">

                     <%
                     }
                     }
                     %>

                     <a movie_num="<%=dto.getMovie_num()%>"
                        style="cursor: pointer; display: flex; flex-direction: column; align-items: left;"
                        class="godetail">
                         <img src="movie_save/<%=poster%>"
                        class="poster"
                        onclick="location.href='index.jsp?main=review/review_moviedetail.jsp?movie_genre=all&sort=<%=sort%>&movie_num=<%=dto.getMovie_num()%>&currentPage=<%=currentPage%>'">
                        <span style="text-align: center; font-size:14px; margin-left:-10px;padding-top:10px;width: 100%;"><%=dto.getMovie_subject()%></span>
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
         <%
         if (loginok != null) {
            if (myid.equals("admin")) {
         %>



         <div style="margin-left: 990px;">
            <button type="button" class="btn btn-default"
               style="color: #653491; border: 1px solid #653491;"
               onclick="location.href='index.jsp?main=movie/movie_addform.jsp'">등록</button>
            <button type="button" class="btn btn-default" id="moviedel">삭제</button>
         </div>
      </div>
      <%
      }
      }
      %>


      <!-- 페이징 처리 -->
      <div style="width: 500px; text-align: center; margin-right: 40%;"
         class="container">
         <ul class="pagination">
            <%
            //이전

            if (startPage > 1) {
            %>
            <li><a
               href="index.jsp?main=movie/movie_list.jsp?movie_genre=all&sort=<%=sort%>&currentPage=<%=startPage - 1%>">이전</a>
            </li>
            <%
            }
            for (int pp = startPage; pp <= endPage; pp++) {
            if (pp == currentPage) {
            %>
            <li class="active"><a
               href="index.jsp?main=movie/movie_list.jsp?movie_genre=all&sort=<%=sort%>&currentPage=<%=pp%>"><%=pp%></a>
            </li>
            <%
            } else {
            %>

            <li><a
               href="index.jsp?main=movie/movie_list.jsp?movie_genre=all&sort=<%=sort%>&currentPage=<%=pp%>"><%=pp%></a>
            </li>
            <%
            }
            }

            //다음
            if (endPage < totalPage) {
            %>
            <li><a
               href="index.jsp?main=movie/movie_list.jsp?movie_genre=all&sort=<%=sort%>&currentPage=<%=endPage + 1%>">다음</a>
            </li>
            <%
            }
            %>
         </ul>
      </div>

      <%
      } else {
      %>
      <div class="tab-content"
         style="padding-top: 40px; margin-left: 170px;">
         <div id="movie_genre">
            <div>
               <div
                  style="display: inline-flex; flex-wrap: wrap; justify-content: center; padding: 0 80px;">
                  <%
                  int i = 0;
                  for (MovieDto dto : sort.equals("recent") ? list_genre_recent
                        : sort.equals("pick") ? list_genre_pick : list_genre_rank) {

                     String poster = dto.getMovie_poster();
                  %>

                  <div style="padding: 10px;">
                     <%
                     if (loginok != null) {
                        if (myid.equals("admin")) {
                     %>
                     <input type="checkbox" name="movie_num" class="movie_num"
                        movie_num="<%=dto.getMovie_num()%>" id="movie_del">
                     <%
                     }
                     }
                     %>
                     <a movie_num="<%=dto.getMovie_num()%>"
                        style="cursor: pointer; display: flex; flex-direction: column; align-items: left;"
                        class="godetail"> <img src="movie_save/<%=poster%>"
                        class="poster"
                        onclick="location.href='index.jsp?main=review/review_moviedetail.jsp?movie_genre=all&sort=<%=sort%>&movie_num=<%=dto.getMovie_num()%>&currentPage=<%=currentPage%>'">
                        <span style="text-align: center; font-size:14px; margin-left:-10px;padding-top:10px;width: 100%;"><%=dto.getMovie_subject()%></span>
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
         <%
         if (loginok != null) {
            if (myid.equals("admin")) {
         %>



         <div style="margin-left: 990px;">
            <button type="button" class="btn btn-default"
               style="color: #653491; border: 1px solid #653491;"
               onclick="location.href='index.jsp?main=movie/movie_addform.jsp'">등록</button>
            <button type="button" class="btn btn-default" id="moviedel">삭제</button>
         </div>
      </div>
      <%
      }
      }
      %>


      <!-- 페이징 처리 -->
      <div style="width: 500px; text-align: center; margin-right: 40%;"
         class="container">
         <ul class="pagination">
            <%
            //이전

            if (startPage > 1) {
            %>
            <li><a
               href="index.jsp?main=movie/movie_list.jsp?movie_genre=<%=movie_genre%>&sort=<%=sort%>&currentPage=<%=startPage - 1%>">이전</a>
            </li>
            <%
            }
            for (int pp = startPage; pp <= endPageGen; pp++) {
            if (pp == currentPage) {
            %>
            <li class="active"><a
               href="index.jsp?main=movie/movie_list.jsp?movie_genre=<%=movie_genre%>&sort=<%=sort%>&currentPage=<%=pp%>"><%=pp%></a>
            </li>
            <%
            } else {
            %>

            <li><a
               href="index.jsp?main=movie/movie_list.jsp?movie_genre=<%=movie_genre%>&sort=<%=sort%>&currentPage=<%=pp%>"><%=pp%></a>
            </li>
            <%
            }
            }

            //다음
            if (endPageGen < totalPageGen) {
            %>
            <li><a
               href="index.jsp?main=movie/movie_list.jsp?movie_genre=<%=movie_genre%>&sort=<%=sort%>&currentPage=<%=endPageGen + 1%>">다음</a>
            </li>
            <%
            }
            %>
         </ul>
      </div>

      <%
      }
      %>
   </div>
</body>
</html>