<%@page import="data.dao.ReviewDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// num
String movie_num=request.getParameter("movie_num");

// dao
ReviewDao rdao = new ReviewDao();

// num에 해당하는 chu 1증가
rdao.updatePick(movie_num);

// num에 해당하는 chu값 json형식으로 반
int movie_pcount = rdao.getPickData(movie_num).getMovie_pcount();

JSONObject ob = new JSONObject();
ob.put("movie_pcount", movie_pcount);
%>
<%=ob.toString()%>