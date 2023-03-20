<%@page import="data.dto.MovieDto"%>
<%@page import="java.io.File"%>
<%@page import="data.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	String movie_num=request.getParameter("movie_num");

	MovieDao dao=new MovieDao();
	MovieDto dto=dao.getData(movie_num);

	String posterName = dto.getMovie_poster();
	
	String uploadPath=getServletContext().getRealPath("/movie_save");
	
	File file=new File(uploadPath+"\\"+posterName);
	if(file.exists()){
	   
	   file.delete();
}
	
	dao.deleteMovie(movie_num);
%>