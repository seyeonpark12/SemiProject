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
	//id읽어오기
	String user_id=request.getParameter("user_id");
	
	//dao
	UserDao dao=new UserDao();
	
	//아이디에 따른 이름 얻기
	String name =dao.getName(user_id);
	
	%>
	
	<div>
	
	<h3><%=name %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;님의 회원가입을 축하합니다</h3>
	<br><br>
	
	<!-- 모달창으로 고치기 -->
	<button type="button" class="btn btn-success"
	onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>
	
	<button type="button" class="btn btn-success"
	onclick="location.href='index.jsp'">HOME</button>
	
	</div>
</body>
</html>