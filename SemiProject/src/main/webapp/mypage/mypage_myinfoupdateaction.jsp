<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String user_num=request.getParameter("user_num");
	UserDao dao=new UserDao();
	UserDto dto=dao.getData(user_num);
	
	String user_pw=request.getParameter("user_pw");
	String user_nickname=request.getParameter("user_nickname");
	String user_hp=request.getParameter("user_hp");
	String user_addr=request.getParameter("user_addr");
	String user_email=request.getParameter("user_email");
	
	dto.setUser_pw(user_pw);
	dto.setUser_nickname(user_nickname);
	dto.setUser_hp(user_hp);
	dto.setUser_addr(user_addr);
	dto.setUser_email(user_email);
	
	
	 //dao선언후 insert호출
	   dao.insertUser(dto);
	 
	 //mypage_form페이지로 이동
	   response.sendRedirect("../index.jsp?main=mypage/mypage_form.jsp");
	%>
