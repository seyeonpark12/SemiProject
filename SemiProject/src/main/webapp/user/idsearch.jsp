<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

	String user_id=request.getParameter("user_id");
	UserDao dao=new UserDao();
	
	int count=dao.isIdCheck(user_id);
	
	JSONObject ob=new JSONObject();
	ob.put("count", count);
%>
<%=ob.toString()%>