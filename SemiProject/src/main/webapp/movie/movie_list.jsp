<%@page import="java.util.List"%>
<%@page import="data.dao.MovieDao"%>
<%@page import="data.dto.MovieDto"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<%

	//로그인상태 확인 후 입력폼  나타내기
	String loginok = (String)session.getAttribute("loginok");
	//id
	String myid = (String)session.getAttribute("myid");

	MovieDao dao = new MovieDao();

	//블럭 < 1 2 3 4 5 >
	int totalCount;
	int totalPage;//총페이지수
	int startPage;//각블럭의 시작페이지
	int endPage;//각블럭의 끝페이지
	int start;//각페이지의 시작번호
	int perPage=8;//한페이지에 보여질 글의 갯수
	int perBlock=5; //한블럭당 보여지는 페이지
	int currentPage;//현재페이지
	//int no;

	//총개수
	totalCount= dao.getTotalCount();


	//현재페이지 번호 읽기(단 null일때는 1페이지로둠)
	if(request.getParameter("currentPage") == null)
   		currentPage = 1;
	else
   		currentPage = Integer.parseInt(request.getParameter("currentPage"));

   		//총 페이지 개수
    	 totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
   
   		//각블럭의 시작페이지.. 현재페이지가 3(s:1, e:5)  6(s:6, e:10)
     	startPage = (currentPage - 1) / perBlock * perBlock + 1;
     	endPage = startPage + perBlock - 1;

     	//총페이지가8 (6~10 ... endpage를 8로 수정해주어야함.)
   		if(endPage > totalPage)
      	endPage = totalPage;
     
     	//각페이지에서 불러올 시작번호
     	start = (currentPage-1) * perPage;
     
     	//각페이지에서 필요한 게시글 가져오기
     	List<MovieDto> list = dao.getList(start, perPage);
     
     
     	//no = totalCount - (currentPage - 1) * perPage;//목록이 아니라 빼둠

%>

<body>

<div class="container">
  

  <ul class="nav nav-tabs">
    <li class="active" style="margin-left: 300px;"><a data-toggle="tab" href="#tabs-1">전체</a></li>
    <li><a data-toggle="tab" href="#tabs-2">로맨스</a></li>
    <li><a data-toggle="tab" href="#tabs-3">액션</a></li>
    <li><a data-toggle="tab" href="#tabs-4">코미디</a></li>
    <li><a data-toggle="tab" href="#tabs-5">공포</a></li>
    <li><a data-toggle="tab" href="#tabs-6">애니메이션</a></li>
    <li><a data-toggle="tab" href="#tabs-7">기타</a></li>
  </ul>

  <div class="tab-content">
    <div id="tabs-1" class="tab-pane fade in active">

       <table class="" style="width: 1000px; border-collapse: none;">
       <br><br>
       		
             <tr>
                <%

                int i=0;
                
                for(MovieDto dto:list)
                {
                	//이미지
                	String poster=dto.getMovie_poster();          	
                	
                	%>
                	<td>
                	  <input type="checkbox" id="movie_del">
                      <a movie_num="<%=dto.getMovie_num()%>" style="cursor: pointer;" class="godetail"><img src="movie_save/<%=poster%>" class="poster">
                      <br>
                      <%=dto.getMovie_subject() %>

                      </a>
                   </td>
                   
                   <%
                   if((i+1)%4==0)
                   {%>
                	   </tr>
                	   <tr>
                   <%}
                   i++;
                                 	
                }
                                
                %>
                   
             </tr>
       </table>
   </div>


   
  </div>
</div>

</body>
</html>