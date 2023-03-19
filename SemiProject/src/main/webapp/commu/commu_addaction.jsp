<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
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
	
	String myid=(String)session.getAttribute("myid");
	UserDao udao=new UserDao();
	String user_num=udao.getNum(myid);
	
	int uploadSize=1024*1024*3;
	MultipartRequest multi=null;
	
	try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8", new DefaultFileRenamePolicy());
	
	
	String commu_category=multi.getParameter("commu_category");
	String commu_subject=multi.getParameter("commu_subject");
	String commu_content=multi.getParameter("commu_content");
	String commu_photo=multi.getFilesystemName("commu_photo");
	
	CommuDto dto=new CommuDto();
	
	dto.setUser_num(user_num);
	dto.setCommu_category(commu_category);
	dto.setCommu_subject(commu_subject);
	dto.setCommu_content(commu_content);
	dto.setCommu_photo(commu_photo);
	
	CommuDao dao=new CommuDao();
	dao.insertCommu(dto);
	
	
	int maxNum=dao.getMaxNum();
	
	//목록으로 이동 maxNum 구한걸로 상세보기 주소 줘야함...??????
	response.sendRedirect("../index.jsp?main=commu/commu_detail.jsp?commu_num="+maxNum+"&currentPage=1");
	
	}catch(Exception e){
		System.out.println("업로드 오류"+e.getMessage());
	}
	%>
	
	
