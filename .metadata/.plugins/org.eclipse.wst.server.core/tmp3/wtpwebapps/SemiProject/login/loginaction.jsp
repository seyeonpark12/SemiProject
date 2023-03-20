<%@page import="data.dao.UserDao"%>
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
</head>
<body>

<%
   String user_id=request.getParameter("user_id");
   String user_pw=request.getParameter("user_pw");
   String saveid=request.getParameter("saveid");  //체크안하면 null
   
   UserDao dao=new UserDao();
   boolean b=dao.isIdPwCheck(user_id, user_pw);
   
   //아이디와 비번이 맞으면 3개의 세션을 저장하고
   //로그인메인으로 이동
   if(b){
      
      //세션유지시간(생략시 30분)
      session.setMaxInactiveInterval(60*60*8);
      session.setAttribute("loginok", "yes");
      session.setAttribute("myid", user_id);
      session.setAttribute("saveid", saveid==null?null:"yes");
   }
 %>
</body>
</html>