<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	String movie_genre=request.getParameter("movie_genre");
	
	response.sendRedirect("../index.jsp?main=movie/movie_list.jsp?movie_genre="+movie_genre+"&currentPage=1");
%>