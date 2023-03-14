<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.CommuDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.CommuDao"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

	<%
	CommuDao dao=new CommuDao();
		
	//페이징처리
	int totalCount; //총 데이터 수
	int totalPage; //총 페이지 수
	int startPage; //각 블럭의 시작 페이지
	int endPage; //각 블럭의 끝 페이지
	int start; //각 페이지의 시작번호
	int perPage=10; //한 페이지에 보여질 글의 갯수 (5개)
	int perBlock=5; //보여질 블럭의 갯수 (5개)
	int currentPage; //현재 페이지
		
	//총 갯수 가져오기
	totalCount=dao.totalCommuCount();
		
	//현재 페이지 번호 읽기
	if(request.getParameter("currentPage")==null)
		   currentPage=1;
		 else
		   currentPage=Integer.parseInt(request.getParameter("currentPage")); 
		     
	//총 페이지 갯수
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		
	//각 블럭의 시작 페이지 
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
		    
	if(endPage>totalPage)
		  endPage=totalPage;
	    
	   //각 페이지에서 불러 올 시작번호
	   start=(currentPage-1)*perPage; 
	    
	   List<CommuDto> list=dao.commuAllList(start, perPage);
	    
	   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");	
	%>
</head>
<body>
	
	<%
	//로그인 세션 받아오기
	
	//세션에서 아이디값 받아오기
	
	//유저dao 선언 자리 
	
	for(CommuDto dto:list){
		
		
	}
	%>
	
	
	<!-- 페이징처리 -->
	<div style="width: 500px; text-align: center; class="container">
	<ul class="pagination">
		<%
			
		//이전
		if(startPage>1){
			%>
			<li>
				<a href="commu_list.jsp?currentPage=<%=startPage-1 %>">이전</a>
			</li>
		<%}
			
			
		for(int pp=startPage;pp<=endPage;pp++){
				
			if(pp==currentPage){
				%>
				<li class="active">
					<a href="commu_list.jsp?currentPage=<%=pp %>"><%=pp %></a>
				</li>
			<% } else{
				%>
				<li>
					<a href="commu_list.jsp?currentPage=<%=pp %>"><%=pp %></a>
				</li>
			<%}
				
		}
			
		//다음
		if(endPage<totalPage){
			%>
			<li>
				<a href="commu_list.jsp?currentPage=<%=endPage+1 %>">다음</a>
			</li>
		<%}
		%>
	</ul>
	</div>
	
</body>
</html>