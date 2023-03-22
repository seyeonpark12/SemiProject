<%@page import="java.io.File"%>
<%@page import="data.dao.MovieDao"%>
<%@page import="data.dto.MovieDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layoutimage/x-icon" href="../layout_image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<% 
   //이미지가 업로드되는 실제경로
   String realPath=getServletContext().getRealPath("/movie_save");
   System.out.println(realPath);

   int uploadSize=1024*1024*2; //2메가
   MultipartRequest multi=null;
 	
 	

   
   try{
      
      multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
            new DefaultFileRenamePolicy());
      
	  //전 이미지 포스터네임
		String posterName=multi.getParameter("before_poster");
      
      //multi변수로 모든 폼데이타 읽어오기
      	String movie_num=multi.getParameter("movie_num");
		String movie_genre=multi.getParameter("movie_genre");
		String movie_subject=multi.getParameter("movie_subject");
		String movie_play=multi.getParameter("movie_play");
		String movie_year=multi.getParameter("movie_year");
		String movie_nara=multi.getParameter("movie_nara");
		String movie_director=multi.getParameter("movie_director");
		String movie_actor=multi.getParameter("movie_actor");
		String movie_content=multi.getParameter("movie_content");
		String movie_poster=multi.getFilesystemName("movie_poster");
		
   		
		File file=new File(realPath+"\\"+posterName);
		if(file.exists()){
		   
		   file.delete();
		}
      
      //dto저장
   		MovieDto dto=new MovieDto();
      	dto.setMovie_num(movie_num);
      	dto.setMovie_genre(movie_genre);
      	dto.setMovie_subject(movie_subject);
      	dto.setMovie_play(movie_play);
      	dto.setMovie_year(movie_year);
      	dto.setMovie_nara(movie_nara);
      	dto.setMovie_director(movie_director);
      	dto.setMovie_actor(movie_actor);
      	dto.setMovie_content(movie_content);
      	dto.setMovie_poster(movie_poster==null?posterName:movie_poster);
      	
      	
      	MovieDao dao=new MovieDao();
      	dao.updateMovie(dto);

     
      //페이지이동
      response.sendRedirect("../index.jsp?main=review/review_moviedetail.jsp?movie_num="+movie_num+"&movie_genre="+movie_genre+"&sort=recent&currentPage=1");
   
      
   }catch(Exception e){
      
      System.out.print("업로드 오류: "+e.getMessage());
   }   
%>
</body>
</html>