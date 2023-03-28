<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
String movie_genre = request.getParameter("movie_genre");
String sort = request.getParameter("sort");

response.sendRedirect("../index.jsp?main=movie/movie_list.jsp?movie_genre=" + movie_genre + "&sort=" + sort + "&currentPage=1");
%>