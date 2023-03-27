<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.MentDto"%>
<%@page import="data.dao.MentDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
MentDao dao = new MentDao();

String ment_num = request.getParameter("ment_num");
String ment_content = request.getParameter("ment_content");

MentDto dto = dao.getMentData(ment_num);

JSONObject ob = new JSONObject();
ob.put("ment_num", dto.getMent_num());
ob.put("ment_content", dto.getMent_content());
%>
<%=ob.toString()%>