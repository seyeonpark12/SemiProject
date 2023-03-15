<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String user_num = request.getParameter("user_num");
ReviewDao dao = new ReviewDao();
List<ReviewDto> list = dao.getAllReview(user_num);

JSONArray arr = new JSONArray();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

for (ReviewDto dto : list) {
	JSONObject ob = new JSONObject();
	ob.put("review_num", dto.getReview_num());
	ob.put("movie_num", dto.getMovie_num());
	ob.put("user_num", dto.getUser_num());
	ob.put("review_score", dto.getReview_score());
	ob.put("review_content", dto.getReview_content());
	ob.put("review_writeday", sdf.format(dto.getReview_writeday()));

	arr.add(ob);
}
%>

<%=arr.toString()%>