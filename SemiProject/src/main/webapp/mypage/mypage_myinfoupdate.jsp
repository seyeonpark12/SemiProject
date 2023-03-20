<%@page import="java.util.List"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
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

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
function passcheck(f){
	
	if(f.pass.value!=f.pass2.value){
		alert("비밀번호가 서로 다릅니다");
		
		//입력 창들 다시 공란으로 해주고
		f.pass.value="";
		f.pass2.value="";
		
		return false; //비밀번호,비밀번호 확인이 다를 경우 action이 호출되지 않게
		
	}
	
}

</script>

</head>

<body>
	<%
	String loginok = (String) session.getAttribute("loginok");
	String myid = (String) session.getAttribute("myid");
	
	String user_num=request.getParameter("user_num");
	UserDao dao=new UserDao();
	UserDto dto=dao.getData(user_num);
	
	%>

   <div>
      <br>
      <br>
      <caption>
         <h3 align="center">회원정보수정</h3>
      </caption>
      
      <%
      for(UserDto dto:list){
    	  
    	  if(loginok!=null){
    		  
    		  if(dto.getUser_id().equals(myid)){%>
      
	<form action="mypage/mypage_myinfoupdate.jsp" method="post" class="form-inline" onsubmit="return passcheck(this)">
	 <input type="hidden" name="num" value="<%=user_num%>"> 
	 
      <div class="modal-body"
         style="padding: 40px 50px; margin-left: 770px;">
         <form class="form-horizontal" action="mypage/mypage_myinfoupdate.jsp"
            method="post" enctype="multipart/form-data">
            <div class="form-group" style="width: 300px;">

               <br> <br> <input type="text" name="name" placeholder="이름"
                  class="form-control" required="required"
                  style="width: 300px; background-color: #FAF7F7" value="<%=dto.getUser_name() %>">


               <br> <br> <input type="text" name="nickname"
                  placeholder="닉네임" class="form-control" required="required"
                  style="width: 300px; background-color: #FAF7F7" value="">


               <br> <br> <input type="text" name="id" placeholder="아이디"
                  class="form-control" required="required"
                  style="width: 300px; background-color: #FAF7F7" value="<%=dto.getUser_id() %>">



               <br> <br> <input type="password" name="pass"
                  placeholder="비밀번호" class="form-control" required="required"
                  style="width: 300px; background-color: #FAF7F7"> <br>
               <br> <input type="password" name="pass" placeholder="비밀번호확인"
                  class="form-control" required="required"
                  style="width: 300px; background-color: #FAF7F7"> <br>
                  
                  
               <br> <input type="text" name="hp" placeholder="휴대번호"
                  class="form-control" required="required"
                  style="width: 300px; background-color: #FAF7F7" value="">

               <br> <br> <input type="text" name="addr" placeholder="주소"
                  class="form-control" required="required"
                  style="width: 300px; background-color: #FAF7F7" value="">
               <br> <br> <input type="text" name="addr"
                  class="form-control" required="required"
                  style="width: 300px; background-color: #FAF7F7" value="">

               <br> <br> <input type="text" name="email"
                  placeholder="이메일" class="form-control" required="required"
                  style="width: 300px; background-color: #FAF7F7" value="">

               <br> <br>
               <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                     <button type="submit" class="btn btn-default"
                        style="width: 180px;">정보수정</button>
                  </div>
                  <br>
                  <button type="button" class="btn btn-default"
                     onclick="location.href='index.jsp?main=mypage/mypage_form.jsp'"
                     style="float: right; margin-right: 125px; margin-top: 20px;">마이페이지</button>
               </div>

            </div>
         </form>
      </div>
	</form>
   </div>
   
</body>
</html>