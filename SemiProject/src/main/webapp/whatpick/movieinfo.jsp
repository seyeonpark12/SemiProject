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
<!-- <link href="css/index.css" type="text/css" rel="stylesheet"> -->
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

a{
color:black;
}
td{
margin-bottom: 100px;
}
</style>

</head>
<body>
   <div style="margin-top: 100px; padding: 0;">
      <form action="movie_addaction.jsp" method="post"
         enctype="multipart/form-data">
         <table style="width: 1000px;">
            <tr height="100">
               <td rowspan="4" width="300">
                  <!-- 영화이미지 보이는 이미지 -->
                   <img id="movie_poster" src="" style="max-width: 200px;">
               </td>
               
               <td width="600"><b class="mv_subject">영화 제목(dto값)</b></td>
            </tr>

            <tr>
               <td><b class="mv_content">개봉연도(dto값) | 영화장르(dto값) | 국가(dto값)</b></td>
            </tr>

        	<tr>
               <td><b class="mv_content"> 평균☆ 별점 값..</b></td>
                <td><b class="mv_content" style="margin-left:-100px;"> 찜♡| 평가하기 </b></td>
            </tr>
         </table>
         
         <hr>
		 <br>
		 <br>
         <div class="write" style="align: center; margin-left: 500px;">
            <h3>기본정보</h3>
            <br>
            <div style="width: 1000px; border: 1px solid gray; margin-left: 1px;  padding: 30px;"id="movie_comtent"> 기본정보 값 불러오기</div>
         </div>

         <div style="margin-left:500px; width: 1000px; height: 100px; padding: 0;">
            <h3>출연/제작</h3>
            <div style="width: 1000px; border: 1px solid gray; margin-left: 1px;  padding: 30px;"id="movie_comtent">출연/제작 값 불러오기</div>

          
 			<h3>예고편</h3>
            <div style="width: 1000px; border: 1px solid gray; margin-left: 1px;  padding: 30px;"id="movie_comtent">예고편 유튜브값 불러오기</div>

          	<h3>리뷰</h3>
            <div style="width: 1000px; border: 1px solid gray; margin-left: 1px;  padding: 30px;"id="movie_comtent">리뷰값 불러오기
            </div>

         </div>
        </form>
      
		 <br>
		 <br>
		  <br>
		 <br>
		  <br>
		 <br>
		  <br>
		 <br>
		  <br>
		 <br>
		  <br>
		 <br>
   </div>
</body>
  
</html>