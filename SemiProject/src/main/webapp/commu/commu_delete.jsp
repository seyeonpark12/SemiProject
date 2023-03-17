<%@page import="java.io.File"%>
<%@page import="java.awt.Window"%>
<%@page import="data.dao.CommuDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	String commu_num=request.getParameter("commu_num");
	
	CommuDao dao=new CommuDao();
	
	//db저장된 이미지명 얻어서 photoName
	String photoName=dao.getCommuData(commu_num).getCommu_photo();
	
	dao.deleteCommu(commu_num);
	
	//이미지파일 삭제
	String realPath=getServletContext().getRealPath("/commu_save");
	File file=new File(realPath+"\\"+photoName);
	file.delete();
	
	response.sendRedirect("../index.jsp?main=commu/commu_totallist.jsp");
	%>
	