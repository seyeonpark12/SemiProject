<%@page import="data.dao.PickDao"%>
<%@page import="data.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
<%
	String user_num=request.getParameter("user_num");
	String movie_num=request.getParameter("movie_num");
	
	MovieDao mdao=new MovieDao();
	PickDao pdao=new PickDao();
	
	pdao.insertPick(user_num, movie_num);
	pdao.updatePick(movie_num);
%>