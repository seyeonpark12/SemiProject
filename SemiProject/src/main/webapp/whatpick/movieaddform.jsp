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
<link href="css/index.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
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
</head>
<body>
 	<div style="margin-left: 100px; margin-top: 100px; padding: 0;">
      <form action="movie/movieaddaction.jsp" method="post" enctype="multipart/form-data">
         <table style="width: 500px;">
            <caption>
               <b>영화포스터</b>
               <span class="glyphicon glyphicon-camera camera"></span>
                <input type="file" name="movie_poster" id="movie_poster" style="visibility: hidden;"
                onchange="readURL(this)">
            </caption>
            
            <tr height="100">
    			<td rowspan="4" width="200">
    				<!-- 이미지 미리보기 할 위치 -->
      				<img id="showimg" src=""  style="max-width:200px;">
    			</td>	
    			<td>
            		<b>영화 제목</b>
            	</td>
            	<td>
            		<input type="text" name="movie_subject" id="movie_subject">
            	</td>
            </tr>
            
            <tr>
            	<td>
            		<b>개봉연도</b>
            	</td>
            	
            	<td>
            		<input type="date" name="movie_year" id="movie_year" value="2023-01-01">
            	</td>
            </tr>
            
             <tr>
            	<td>
            		<b>영화장르</b>
            	</td>
            	
            	<td>
            		<select name="movie_genre">
            			<option value="로맨스">로맨스</option>
            			<option value="액션">액션</option>
            			<option value="코미디">코미디</option>
            			<option value="공포">공포</option>
            			<option value="애니메이션">애니메이션</option>
            			<option value="기타">기타</option>
            		</select>
            	</td>
            </tr>
            
             <tr>
            	<td>
            		<b>국가</b>
            	</td>
            	
            	<td>
            		<input type="text" name="movie_nara" id="movie_nara">
            	</td>
            </tr>
         </table>
      </form>
   </div>

	<div style="margin-left: 100px;">
		<h3>줄거리</h3>
		<br>
		<textarea style="width: 500px; height: 200px;" name="movie_content" id="movie_comtent"></textarea>
	</div>

	<div style="margin-left: 100px;	 width: 500px; height: 100px; padding: 0;" >
		<h4>출연/제작</h4>
		<div style="border: 1px solid gray">
			<b>감독</b>
			<br>
			<input type="text" name="movie_director" id="movie_director">
			<br>
			<b>출연진</b>
			<br>
			<input type="text" name="movie_actor" id="movie_actor" style="width: 200px;">
			<br>
		</div>
	</div>
	<br><br><br>
	<button type="submit" class="btn btn-info btn-ls" style="margin-left: 300px; ">영화등록</button>
	
</body>
</html>