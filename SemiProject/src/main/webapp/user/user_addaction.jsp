<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//한글 엔코딩
	request.setCharacterEncoding("utf-8");
	
	//데이터 읽어서 dto읽기
	UserDto dto=new UserDto();
	
	String user_id=request.getParameter("user_id");
	String user_pw=request.getParameter("user_pw");
	String user_name=request.getParameter("user_name");
	String user_nickname=request.getParameter("user_nickname");
	String user_hp=request.getParameter("user_hp");
	String user_addr=request.getParameter("user_addr");
	String user_email=request.getParameter("user_email");

	
	dto.setUser_id(user_id);
	dto.setUser_pw(user_pw);
	dto.setUser_name(user_name);
	dto.setUser_nickname(user_nickname);
	dto.setUser_hp(user_hp);
	dto.setUser_addr(user_addr);
	dto.setUser_email(user_email);
	
	//dao 선언 후 insert 호출
	UserDao dao=new UserDao();
	dao.insertUser(dto);
	
	
	//gaipsuccess페이지로 이동
	//response.sendRedirect("../index.jsp?main=user/gaipsuccess.jsp?id="+user_id);

%>