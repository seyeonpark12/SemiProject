<%@page import="data.dao.PickDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="data.dto.MovieDto"%>
<%@page import="data.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layoutimage/x-icon"
   href="../layout_image/titlelogo.ico">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
   rel="stylesheet">

<link href="css/info.css" type="text/css" rel="stylesheet">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
   <div style="padding: 0; margin-top:100px;">
      <input type="hidden" id="movie_num" value="<%=movie_num%>"> <input
         type="hidden" id="myid" value="<%=myid%>"> <input
         type="hidden" id="user_num" value="<%=user_num%>"> <input
         type="hidden" id="user_nickname" value="<%=user_nickname%>">

      <!-- Modal -->
      <div class="review_modal modal fade" id="modal" role="dialog">
         <div class="review_modal modal-dialog">

            <!-- Modal content-->
            <div class="review_modal modal-content" style="margin-top: 170px;">
               <div class="review_modal modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <img alt="" src="movie_save/<%=poster%>"
                     movie_num="<%=movie_num%>" width="200">
                  <div style="text-align: center; font-size: 20pt">
                     <b style="font-size: 15pt;"> &nbsp;&nbsp;&nbsp;<%=mdto.getMovie_subject()%></b>
                  </div>
               </div>
               <div class="review_modal modal-score">

                  <form class="mb-3" name="myform" id="myform" method="post">
                     <fieldset>
                        <input type="radio" name="review_Star" value="5" id="rate1">
                        <label for="rate1">★</label> <input type="radio"
                           name="review_Star" value="4" id="rate2"> <label
                           for="rate2">★</label> <input type="radio" name="review_Star"
                           value="3" id="rate3"> <label for="rate3">★</label> <input
                           type="radio" name="review_Star" value="2" id="rate4"> <label
                           for="rate4">★</label> <input type="radio" name="review_Star"
                           value="1" id="rate5"> <label for="rate5">★</label>
                     </fieldset>
                     <div>
                        <textarea class="col-auto form-control" id="review_contents"
                           placeholder="욕설과 비방을 작성 시 제재를 당할 수 있습니다." required="required"></textarea>
                     </div>
                  </form>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal"
                     id="review_save">저장하기</button>
               </div>
            </div>
         </div>
      </div>
      <!-- Modal 끝-->
      <table style="width: 1000px; height: 300px;">
         <tr>
            <td rowspan="3" width="30%">
               <!-- 영화이미지 보이는 이미지 --> <img src="movie_save/<%=poster%>"
               movie_num="<%=movie_num%>" id="movie_poster"
               style="max-width: 100%;">
            </td>

            <td colspan="4" width="70%" height="70%"
               style="padding: 200px 0 0 30px;"><b class="mv_subject"><%=mdto.getMovie_subject()%></b></td>
         </tr>

         <tr>
            <td colspan="4" style="padding: 0 30px;"><b
               class="mv_content_year" style="color: gray; font-weight: 400;"><%=mdto.getMovie_year()%>
                  | <%=mdto.getMovie_genre()%> | <%=mdto.getMovie_nara()%></b></td>
         </tr>

         <tr>
            <td colspan="4" style="padding: 30px; width: 100%"><b
               class="mv_content_year" style="color: orange; font-size: 20px;">
                  ★ <%=review_avgscore%></b></td>
         </tr>
      </table>
      <%
      if (loginok != null) {
      %>
      <%
      if (myid.equals("admin")) {
      %>
      <div style="float: left; margin-top: -20px;">
         <button type="button" class="btn btn-default btn-sm"
            style="margin-left: 1050px; border: 1px solid #CBB6D9; color: #CBB6D9; float: left;"
            onclick="location.href='index.jsp?main=movie/movie_updateform.jsp?movie_num=<%=movie_num%>'">영화수정</button>
         <button type="button" class="btn btn-default btn-sm"
            style="border: 1px solid #a02982; color: #a02982; float: left; margin-left: 5px;"
            id="movie_delete" movie_num="<%=movie_num%>">영화삭제</button>
      </div>
      <%
      }
      %>
      <%
      if (pdao.isCheck(user_num, movie_num) == false && !myid.equals("admin")) {
      %>
      <div style="float: right; margin-top: -180px; margin-right: 300px;">
         <b id="movie_pickadd" movie_num="<%=movie_num%>"
            class="mv_content_es"
            style="margin-left: -100px; cursor: pointer; font-size: 16px; font-weight: 400;">PICK
            <font style="margin-left: 5px; color: red; font-size: 18px;">♡</font>
         </b> <b data-toggle="modal" data-target="#modal" class="mv_content_es"
            style="font-size: 16px; margin-left: 5px; font-weight: 400;"
            id="review_add">|&nbsp;&nbsp;리뷰하기<span style="margin-left: 5px;"
            class="glyphicon glyphicon-pencil"></span></b>

      </div>

      <%
      } else if (pdao.isCheck(user_num, movie_num) == true && !myid.equals("admin")) {
      %>
      <div style="float: right; margin-top: -180px; margin-right: 300px;">
         <b id="movie_pickdel" movie_num="<%=movie_num%>"
            class="mv_content_es"
            style="margin-left: -100px; cursor: pointer; font-size: 16px; font-weight: 400;">
            PICK<font style="margin-left: 5px; color: red; font-size: 18px;">♥</font>
         </b> <b data-toggle="modal" data-target="#modal" class="mv_content_es"
            style="font-size: 16px; margin-left: 5px; font-weight: 400;"
            id="review_add">|&nbsp;&nbsp;리뷰하기<span style="margin-left: 5px;"
            class="glyphicon glyphicon-pencil"></span></b>
      </div>
      <%
      }
      %>
      <%
      }
      %>


      <div style="float: right; margin-top: -20px;">
         <!-- 목록가기 버튼.. -->
         <button type="button" class="btn btn-default btn-sm"
            style="margin-right: 300px; border: 1px solid #CBB6D9; color: #fff; background-color: #CBB6D9; float: right;"
            onclick="location.href='index.jsp?main=movie/movie_list.jsp?movie_genre=all&sort=recent&currentPage=1'">목록</button>
      </div>
      <br>
      <hr>

      <div
         style="width: 1000px; padding: 20px; border: 1px solid lightgray; border-radius: 30px;">
         <h3
            style="padding: 10px 30px 0px 30px; font-size: 18px; font-weight: 700;">기본정보</h3>
         <div
            style="width: 100%; margin-bottom: 20px; padding: 30px; font-size: 16px; font-weight: 400; color: gray;"
            id="movie_content"><%=mdto.getMovie_content()%></div>
         <hr>
         <h3
            style="padding: 10px 30px 0px 30px; font-size: 18px; font-weight: 700;">출연/제작</h3>
         <div>
            <div
               style="width: 100%; padding: 30px 30px 0px 30px; font-size: 16px; font-weight: 400; color: gray;"
               id="movie_content">

               감독 |
               <%=mdto.getMovie_director()%></div>
            <div
               style="width: 100%; padding: 15px 30px 30px 30px; font-size: 16px; font-weight: 400; color: gray;"
               id="movie_content">
               배우 |
               <%=mdto.getMovie_actor()%>
            </div>
         </div>

         <hr>
         <div style="width: 100%; padding: 10px 30px;" id="movie_content">
            <iframe width="900" height="506" src="<%=mdto.getMovie_play()%>"
               title="<%=mdto.getMovie_subject()%>" frameborder="0"
               allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
               allowfullscreen> </iframe>
         </div>
         <hr>
         <h3 style="padding: 30px; font-size: 18px; font-weight: 700;">리뷰</h3>
         <div style="width: 100%; margin-left: 1px;" id="movie_content">
            <table style="width: 100%;">
               <tr>
                  <th width="10%" class="myinfo" style="text-align: center;">번호</th>
                  <th width="60%" class="myinfo" style="text-align: center;">내용</th>
                  <th width="10%" class="myinfo" style="text-align: center;">작성자</th>
                  <th width="10%" class="myinfo" style="text-align: center;">점수</th>
                  <th width="10%" class="myinfo" style="text-align: center;">작성일</th>
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
               for (ReviewDto dto : list_movie) {
               %>

               <%
               String writer_nickname = udao.getName_num(dto.getUser_num());
               %>

               <tr>
                  <td align="center" height="80"><%=no--%></td>
                  <td align="center"><%=dto.getReview_content()%></td>
                  <td align="center"><%=writer_nickname%></td>
                  <td width="30" style="text-align: center; color: orange;"><%="★ " + Math.round(dto.getReview_score())%></td>
                  <td width="200" style="text-align: center;"><%=sdf.format(dto.getReview_writeday())%></td>
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
               <li><a
                  href="index.jsp?main=review/review_moviedetail.jsp?movie_genre=<%=movie_genre%>&movie_num=<%=movie_num%>&currentPage=<%=currentPage%>&currentPage_reviewe=<%=startPage - 1%>">이전</a></li>
               <%
               }
               for (int pp = startPage; pp <= endPage; pp++) {
               if (pp == currentPage_review) {
               %>
               <li class="active"><a
                  href="index.jsp?main=review/review_moviedetail.jsp?movie_genre=<%=movie_genre%>&movie_num=<%=movie_num%>&currentPage=<%=currentPage%>&currentPage_review=<%=pp%>"><%=pp%></a></li>
               <%
               } else {
               %>
               <li><a
                  href="index.jsp?main=review/review_moviedetail.jsp?movie_genre=<%=movie_genre%>&movie_num=<%=movie_num%>&currentPage=<%=currentPage%>&currentPage_review=<%=pp%>"><%=pp%></a></li>
               <%
               }
               }
               //다음
               if (endPage < totalPage) {
               %>
               <li><a
                  href="index.jsp?main=review/review_moviedetail.jsp?movie_genre=<%=movie_genre%>&movie_num=<%=movie_num%>&currentPage=<%=currentPage%>&currentPage_review=<%=endPage + 1%>">다음</a></li>
               <%
               }
               %>
            </ul>
         </div>

      </div>
   </div>

</body>

</html>