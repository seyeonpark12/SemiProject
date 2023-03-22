<%@page import="data.dto.MovieDto"%>
<%@page import="data.dao.MovieDao"%>
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
<link href="css/movie.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script type="text/javascript">
      $(function(){
         $("span.camera").click(function(){
            $("#movie_poster").trigger("click"); //이벤트 강제호출 : trigger
         });
      });
      
      //이미지미리보기
      function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader(); 
               reader.onload = function (e) {
                   $('#showimg').attr('src', e.target.result);
               }                   
               reader.readAsDataURL(input.files[0]);
           }
       }
   </script>
   
   
<style type="text/css">


*{
   margin: 0 auto;
   padding: 0;
   list-style: none;
   font-family:"Noto Sans KR";
   color: black;
}

.mv_subject {
   font-size: 33px;
   font-weight: 700;
   letter-spacing: -1.2px;
   line-height: 41px;
}

.mv_content {
   font-size: 17px;
   font-weight: 400;
   letter-spacing: -0.7px;
   line-height: 22px;
   margin-top: 4px;
   margin-bottom: 10px;
}

td{
margin-bottom: 100px;
}
</style>

<%
   String movie_num=request.getParameter("movie_num");
   
   
   MovieDao dao=new MovieDao();
   MovieDto dto=dao.getData(movie_num);
%>
</head>
<body>
   <div style="margin-top: 100px; padding: 0; margin-bottom:300px;">
      <form action="movie/movie_updateaction.jsp" method="post"
         enctype="multipart/form-data">
         <input type="hidden" name="movie_num" value="<%=movie_num%>">
         <%-- <input type="hidden" name="before_poster" value="<%=dto.getMovie_poster()%>"> --%>

         <table style="width: 1000px;">
            <caption>
               <b class="mv_content">영화포스터</b> <span
                  class="glyphicon glyphicon-camera camera"></span> <input
                  type="file" name="movie_poster" id="movie_poster" 
                  style="visibility: hidden;" onchange="readURL(this)">
            </caption>
            <tr height="100">
               <td rowspan="4" width="200">
                  <!-- 이미지 미리보기 할 위치 --> <img id="showimg" src="movie_save/<%=dto.getMovie_poster()%>"
                  style="max-width: 200px;">
               </td>
               <td width="200"><b class="mv_subject">영화 제목</b></td>
               <td width="400"><input type="text" name="movie_subject" required="required"
                  id="movie_subject" class="form-control" value="<%=dto.getMovie_subject()%>"></td>
            </tr>

            <tr>
               <td><b class="mv_content">개봉연도</b></td>

               <td><input type="date" name="movie_year" id="movie_year" required="required"
                  class="form-control" style="width: 200px;" value="<%=dto.getMovie_year()%>">
               </td>
            </tr>

            <tr>
               <td><b class="mv_content">영화장르</b></td>

               <td><select name="movie_genre" class="form-control" required="required"
                  style="width: 200px;">
                     <option value="romance" <%=dto.getMovie_genre().equals("romance")?"selected":""%>>로맨스</option>
                     <option value="action" <%=dto.getMovie_genre().equals("action")?"selected":""%>>액션</option>
                     <option value="comedy" <%=dto.getMovie_genre().equals("comedy")?"selected":""%>>코미디</option>
                     <option value="horror" <%=dto.getMovie_genre().equals("horror")?"selected":""%>>공포</option>
                     <option value="animation" <%=dto.getMovie_genre().equals("animation")?"selected":""%>>애니메이션</option>
                     <option value="etc" <%=dto.getMovie_genre().equals("etc")?"selected":""%>>기타</option>
               </select></td>
            </tr>

            <tr>
               <td><b class="mv_content">국가</b></td>

               <td><input type="text" name="movie_nara" id="movie_nara" required="required"
                  class="form-control" style="width: 200px;"value="<%=dto.getMovie_nara()%>"></td>
            </tr>
         </table>

         <div class="write" style="align: center; margin-left: 300px;">
            <h3>줄거리</h3>
            <br>
            <textarea style="width: 1000px; height: 400px;" name="movie_content" required="required"
               id="movie_comtent"><%=dto.getMovie_content()%></textarea>
         </div>

         <div
            style="margin-left:300px; width: 1000px; height: 100px; padding: 0;">
            <h3>출연/제작</h3>
            <div style="height: 100px; padding-left: 100px;">
               <b class="mv_content">감독</b> <br> <input type="text"
                  name="movie_director" id="movie_director" class="form-control" required="required"
                  style="width: 300px;" value="<%=dto.getMovie_director()%>">
            </div>

            <div style="height: 100px; padding-left: 100px;">
               <b class="mv_content">출연진</b> <br> <input type="text"
                  name="movie_actor" id="movie_actor" class="form-control" required="required"
                  style="width: 300px;" value="<%=dto.getMovie_actor()%>">
            </div>

            <div>
               <div style="height: 100px; padding-left: 100px;">
                  <b class="mv_content">유튜브 트레일러(링크)</b> <input type="text"
                     name="movie_play" id="movie_play" class="form-control" required="required"
                     style="width: 700px;" value="<%=dto.getMovie_play()%>">
               </div>
            </div>

          
               <button type="submit" class="btn btn-default btn-ls"
                  style="float: right; margin-right: 500px;">영화수정</button>
            
         </div>
        </form>
   </div>

   
   
</body>
</html>