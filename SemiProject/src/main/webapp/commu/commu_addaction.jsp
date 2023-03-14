<%@page import="data.dao.CommuDao"%>
<%@page import="data.dto.CommuDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	request.setCharacterEncoding("utf-8");
	
	String realPath=getServletContext().getRealPath("/commu_save");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*3;
	MultipartRequest multi=null;
	
	try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8", new DefaultFileRenamePolicy());
	
	String category=multi.getParameter("category");
	String subject=multi.getParameter("subject");
	String content=multi.getParameter("content");
	String photo=multi.getFilesystemName("photo");
	
	CommuDto dto=new CommuDto();
	dto.setUser_num("1");
	dto.setCommu_category(category);
	dto.setCommu_subject(subject);
	dto.setCommu_content(content);
	dto.setCommu_photo(photo);
	
	CommuDao dao=new CommuDao();
	dao.insertCommu(dto);
	
	//목록으로 이동 maxNum 구한걸로 주소 줘야함...??????
	//response.sendRedirect("commu/commu_addform.jsp");
	
	}catch(Exception e){
		System.out.println("업로드 오류"+e.getMessage());
	}
	%>
