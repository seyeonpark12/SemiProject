<%@page import="data.dao.MentDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	MentDao dao=new MentDao();
	
	String ment_num=request.getParameter("ment_num");
	
	dao.deleteMent(ment_num);
	%>