<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
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
	request.setCharacterEncoding("utf-8");
	
	String num=request.getParameter("num"); //num추가
    String name=request.getParameter("name");
    String pass=request.getParameter("pass");
    String hp=request.getParameter("hp");
    String addr=request.getParameter("addr");
    String email=request.getParameter("email")+"@"+request.getParameter("email2");
    
    //dto로 묶어주기
    UserDto dto=new UserDto();
    dto.getUser_num();//num추가
    dto.getUser_id();
    dto.getUser_pw();
    dto.getUser_name();
    dto.getUser_nickname();
    dto.getUser_hp();
    dto.getUser_addr();
    dto.getUser_email();
    dto.getUser_gaip();
    
    //dao선언
    UserDao dao=new UserDao();
    
    //update 메서드 호출
    dao.updateMyInfo(dto);
    
    //gaipsuccess페이지로 이동
    response.sendRedirect("../index.jsp?main=member/myinfo.jsp");
    //dao에서 id를 엄기면 name을 받아오기 때문에 id를 넘겨버림 
	%>
</body>
</html>