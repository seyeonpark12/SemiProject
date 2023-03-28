<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.MovieDto"%>
<%@page import="data.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Cookie[] cookies =request.getCookies();
Cookie cookie;

//MovieDao dao=new MovieDao();
//movie_num=dao.getData(movie_num).getMovie_poster();

String result="";

if(cookies!=null)
{
	for(int i=0; i<cookies.length; i++)
	{
		if(cookies[i].getName().equals("recent_mv")){
			if(!cookies[i].getValue().equals("")){
				result=cookies[i].getValue();
			}
		}
	}
}

String[] resultArr=result.split("&");

MovieDao dao= new MovieDao();

JSONArray jarr=new JSONArray();

for(String r:resultArr)
{
	MovieDao mdao=new MovieDao();
	String movie_num=mdao.getData(r).getMovie_poster();
	
	//MovieDto dto=dao.getData(r);
	JSONObject ob=new JSONObject();
	ob.put("movie_num",movie_num);
	jarr.add(ob);
}
%>

<%=jarr.toString()%>