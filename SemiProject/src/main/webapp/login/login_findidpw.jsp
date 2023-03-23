<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>header</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
   rel="stylesheet">
<link href="css/header.css" type="text/css" rel="stylesheet">
<!-- 아이콘.. -->
<script src="https://kit.fontawesome.com/7027f21a5f.js"
   crossorigin="anonymous"></script>


<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(function(){
		
		/* $(document).on("click","#login",function(){
			
			var findid=$("#login")
			//alert("ㅇㅇ");
			
			
		}); */
		
		
		function id_search() { 
		 	var frm = document.idfindscreen;

		 	if (frm.user_email.value.length < 1) {
			  alert("이메일을 입력해주세요");
			  return;
			 }

			 if (frm.user_hp.value.length != 12) {
				  alert("핸드폰번호를 정확하게 입력해주세요");
				  return;
			 }

		 frm.method = "post";
		 frm.action = "login/login_findidresult.jsp"; //넘어간화면
		 frm.submit();  
		 }
		
	});
	
	
	
	</script>

</head>
<body>
   <div style="padding: 100px;">

      <form name="idfindscreen" method = "POST"
         style="float: left; width: 50%; padding: 50px; text-align: center;">
         <h3 align="center" style="font-weight: 600;">아이디찾기</h3>
         <div class="form-group" style="width: 300px; margin-top: 50px;">

            <input type="text" name="user_email" placeholder="이메일"
               class="form-control" required="required"
               style="width: 300px; margin: 10px 0px; background-color: #fafafa">
            <input type="text" name="user_hp" placeholder="전화번호 '-'까지 입력해주세요"
               class="form-control" required="required"
               style="width: 300px; background-color: #fafafa">


            <div style="padding: 30px;">
               <button type="button" class="btn btn-default btn-sm" id="login"
                  style="width: 100px; margin: 10px 0px;"
                  onClick="id_search()">아이디 찾기</button>
                  
                  <!-- <input type="button" name="enter" value="찾기"  onClick="id_search()"> -->

               <button type="button" class="btn btn-default btn-sm"
                  style="width: 100px;"
                  onclick="location.href='index.jsp'">뒤로가기</button>
            </div>

         </div>
      </form>



      <form  name="pwfindscreen" method = "POST"
         style="float: right; width: 50%; padding: 50px; text-align: center;">

         <h3 align="center" style="font-weight: 600;">비밀번호찾기</h3>

         <div class="form-group" style="width: 300px; margin-top: 50px;">

            <input type="text" name="user_id" placeholder="아이디"
               class="form-control" required="required"
               style="width: 300px; margin: 10px 0px; background-color: #fafafa">
            <input type="text" name="user_hp" placeholder="전화번호 '-'까지 입력해주세요"
               class="form-control" required="required"
               style="width: 300px; background-color: #fafafa"
               onclick="location.href='index.jsp'">


            <div style="padding: 30px;">
               <button type="submit" class="btn btn-default btn-sm" id="login"
                  style="width: 100px; margin: 10px 0px;">비밀번호찾기</button>

               <button type="button" class="btn btn-default btn-sm"
                  style="width: 100px;">뒤로가기</button>
            </div>

         </div>
      </form>

   </div>

</body>

</html>