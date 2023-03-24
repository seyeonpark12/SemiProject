<%@page import="data.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String review_num = request.getParameter("review_num");

ReviewDao dao = new ReviewDao();
dao.deleteReview(review_num);
%>