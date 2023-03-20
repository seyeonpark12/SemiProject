<<<<<<< HEAD
=======
<%@page import="data.dao.CommuDao"%>
<%@page import="data.dto.CommuDto"%>
>>>>>>> 9cc452e1f934ac60450140fac907fb448716d522
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    //이미지 미리보기   
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
            reader.onload = function (e) {
            //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                $('#showimg').attr('src', e.target.result);
                //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                //(아래 코드에서 읽어들인 dataURL형식)
            }                   
            reader.readAsDataURL(input.files[0]);
            //File내용을 읽어 dataURL형식의 문자열로 저장
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


</style>

</head>

<body>
	
<<<<<<< HEAD


      <br>
      <br>
      <div style="margin: 30px 30px;">
      <form action="commu/commu_addaction.jsp" method="post" enctype="multipart/form-data">
=======
	<%
	String commu_num=request.getParameter("commu_num");
	String currentPage=request.getParameter("currenPage");
	
	CommuDao dao=new CommuDao();
	CommuDto dto=dao.getCommuData(commu_num);
	%>
      <br>
      <br>
      <div style="margin: 30px 30px;">
      <form action="commu/commu_updateaction.jsp" method="post" enctype="multipart/form-data">
      <input type="hidden" name="commu_num" value="<%=commu_num%>">
      <input type="hidden" name="currentPage" value="<%=currentPage%>">
      
>>>>>>> 9cc452e1f934ac60450140fac907fb448716d522
         <table class="table table-bordered" style="width: 800px;">
         <caption><b class="mv_content">게시글 수정</b></caption>
            <tr>
               <td>
               <select style="width: 200px;" name="commu_category" class="form-control" required="required">
<<<<<<< HEAD
                  <option value="자유" selected="selected">자유</option>
=======
                  <option value="자유">자유</option>
>>>>>>> 9cc452e1f934ac60450140fac907fb448716d522
                  <option value="동행">동행</option>
                  <option value="나눔">나눔</option>
               </select>
               </td>
               
               <td>
<<<<<<< HEAD
               <input type="text" name="commu_subject" class="form-control" style="width: 400px;" required="required">
=======
               <input type="text" name="commu_subject" class="form-control" style="width: 400px;" required="required" value="<%=dto.getCommu_subject()%>">
>>>>>>> 9cc452e1f934ac60450140fac907fb448716d522
               </td>
            </tr>
            
            <tr>
               <td colspan="2">
                  <div>
<<<<<<< HEAD
                  <img id="showimg" style=" max-width: 200px; margin-top: 10px; margin-left: 10px;">
                  </div>
                  <textarea name="commu_content" id="commu_content" required="required" style="width: 100%; height: 400px; border: none;  outline: none;"></textarea>
                  <input type="file" name="commu_photo" id="commu_photo" class="form-control" onchange="readURL(this)">
=======
                  <img id="showimg" src="<%=dto.getCommu_photo()==null?"":"commu_save/"+dto.getCommu_photo() %>"  style=" max-width: 200px; margin-top: 10px; margin-left: 10px;">
                  </div>
                  <textarea name="commu_content" id="commu_content" required="required" style="width: 100%; height: 400px; border: none;  outline: none;"><%=dto.getCommu_content() %></textarea>
                  <input type="file" name="commu_photo_update" id="commu_photo_update" class="form-control" onchange="readURL(this)">
>>>>>>> 9cc452e1f934ac60450140fac907fb448716d522
               </td>
            </tr>
            
            <tr>
               <td colspan="2" align="center">
<<<<<<< HEAD
               <button type="submit" class="btn btn-default">저장</button>
               <button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=commu/commu_totallist.jsp'">목록</button>
=======
               <button type="submit" class="btn btn-default">수정</button>
>>>>>>> 9cc452e1f934ac60450140fac907fb448716d522
               </td>
            </tr>

         </table>
      </form>
   
   </div>

</body>
</html>