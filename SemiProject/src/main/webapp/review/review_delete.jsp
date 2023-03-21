<%@page import="data.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String review_num=request.getParameter("review_num");
ReviewDao rdao = new ReviewDao();
rdao.deleteReview(review_num);
%>