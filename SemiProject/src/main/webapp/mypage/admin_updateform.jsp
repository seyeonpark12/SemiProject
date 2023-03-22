<%@page import="data.dto.CommuDto"%>
<%@page import="data.dao.CommuDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<link href="css/info.css" type="text/css" rel="stylesheet">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<%
String loginok = (String) session.getAttribute("loginok");
String myid = (String) session.getAttribute("myid");

UserDao dao = new UserDao();
List<UserDto> list = dao.getAllUsers();

String user_num = request.getParameter("user_num");

UserDto dto=dao.getData(user_num);

%>
<body>
   <div>
      <div class="myinfo_div">
         <table style="width: 700px;">
            <h3 align="center">관리자정보수정</h3>

            <input type="hidden" name="user_num" value="<%=user_num%>">

           

            <tr>
               <th class="myinfo" width="200">이름</th>
               <td class="myinfo"><%=dto.getUser_name()%></td>
            </tr>
            <tr>
               <th class="myinfo">닉네임</th>
               <td class="myinfo"><input type="text" name="name"
                  class="form-control" required="required"
                  style="width: 300px; background-color: #fcfcfc"
                  value="<%=dto.getUser_nickname()%>"></td>

            </tr>

            <tr>
               <th class="myinfo">아이디</th>
               <td class="myinfo"><%=dto.getUser_id()%></td>
            </tr>

            <tr>
               <th class="myinfo" width="100">비밀번호</th>
               <td class="myinfo"><input type="text" name="name"
                  class="form-control" required="required"
                  style="width: 300px; background-color: #fcfcfc"
                  value="<%=dto.getUser_pw()%>"></td>
            </tr>


            <tr>
               <th class="myinfo" width="100">비밀번호확인</th>
               <td class="myinfo"><input type="text" name="name"
                  class="form-control" required="required"
                  style="width: 300px; background-color: #fcfcfc"
                  value=""></td>
            </tr>
            
            <tr>
               <th class="myinfo">핸드폰번호</th>
               <td class="myinfo"><input type="text" name="name"
                  class="form-control" required="required"
                  style="width: 300px; background-color: #fcfcfc"
                  value="<%=dto.getUser_hp()%>"></td>
            </tr>

            <tr>
               <th class="myinfo" width="100">주소</th>
               <td class="myinfo"><input type="text" name="name"
                  class="form-control" required="required"
                  style="width: 300px; background-color: #fcfcfc"
                  value="<%=dto.getUser_addr()%>"></td>
            </tr>

            <tr>
               <th class="myinfo" width="100">이메일</th>
               <td class="myinfo"><input type="text" name="name"
                  class="form-control" required="required"
                  style="width: 300px; background-color: #fcfcfc"
                  value="<%=dto.getUser_email()%>"></td>
            </tr>
           
         </table>
         <br> <br>
         <div class="form-group">

            <div style="float: right;">
               <button type="button" class="btn btn-default btn-sm" 
              	  onclick="location.href='index.jsp?main=mypage/mypage_myinfoupdateaction.jsp?user_num=<%=user_num %>'"
                  style="margin-left: -600px; margin-bottom: 10px;">관리자
                  정보수정</button>

               <button type="button" class="btn btn-default btn-sm"
                  onclick="location.href='index.jsp?main=mypage/admin_mypage_form.jsp'"
                  style="margin-bottom: 10px; margin-right: 10px;">관리자페이지</button>
            </div>

         </div>
      </div>
      </form>
   </div>
   </div>
</body>
</html>