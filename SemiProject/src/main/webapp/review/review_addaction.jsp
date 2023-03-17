<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//한글 엔코딩
request.setCharacterEncoding("utf-8");

ReviewDto dto = new ReviewDto();

String movie_num=request.getParameter("movie_num");
String user_num=request.getParameter("user_num");
double review_score= Integer.parseInt(request.getParameter("review_score"));
String review_content= request.getParameter("review_content");

dto.setMovie_num(movie_num);
dto.setUser_num(user_num);
dto.setReview_score(review_score);
dto.setReview_content(review_content);

ReviewDao dao = new ReviewDao();
dao.insertreview(dto);

int num=dao.getMaxNum();

response.sendRedirect("../index.jsp?main=whatpick/category.jsp?num=" + num);
%>