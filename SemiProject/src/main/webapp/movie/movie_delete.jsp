<%@page import="data.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	String movie_num=request.getParameter("movie_num");

	MovieDao dao=new MovieDao();
	dao.deleteMovie(movie_num);
%>