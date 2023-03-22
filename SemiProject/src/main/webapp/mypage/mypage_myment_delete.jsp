<%@page import="data.dao.MentDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dao.CommuDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
 	//내 댓글 체크박스 삭제action!!!!
	String loginok = (String) session.getAttribute("loginok");
	String myid = (String) session.getAttribute("myid");
	
	UserDao udao=new UserDao();
	String user_num=request.getParameter("user_num");
	
	String nums=request.getParameter("nums");
	
	String [] num=nums.split(",");
	
	MentDao dao=new MentDao();
	
	for(String ment_n:num){
		
		dao.deleteMent(ment_n);
		
	} 

	response.sendRedirect("../index.jsp?main=mypage/login_mypage_mycomment.jsp?user_num="+user_num);
	%>
	

	
	