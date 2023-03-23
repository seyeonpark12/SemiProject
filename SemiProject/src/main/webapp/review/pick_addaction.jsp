<%@page import="data.dao.PickDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
PickDao pdao = new PickDao();
String user_num = request.getParameter("user_num");
String movie_num = request.getParameter("movie_num");
pdao.insertPick(user_num, movie_num);

%>