<%@page import="data.dao.MentDao"%>
<%@page import="data.dto.MentDto"%>
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
	
	String myid=request.getParameter("myid");
	String ment_content=request.getParameter("ment_content");
	String commu_num=request.getParameter("commu_num");
	String currentPage=request.getParameter("currentPage");
	
	MentDto dto=new MentDto();
	MentDao dao=new MentDao();
	
	dto.setUser_num(myid);
	dto.setMent_content(ment_content);
	dto.setCommu_num(commu_num);
	
	dao.insertMent(dto);
	
	response.sendRedirect("../index.jsp?main=commu/commu_detail.jsp?currentPage="+currentPage);
	
	
	%>
</body>
</html>