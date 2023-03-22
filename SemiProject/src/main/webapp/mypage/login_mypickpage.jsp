<%@page import="data.dto.PickDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.PickDao"%>
<%@page import="data.dao.UserDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layoutimage/x-icon"
	href="../layout_image/titlelogo.ico">
<link href="css/info.css" type="text/css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>


	<%
	String loginok = (String) session.getAttribute("loginok");
	String myid = (String) session.getAttribute("myid");
	
	UserDao dao = new UserDao();	
	String user_num=request.getParameter("user_num");
	
	PickDao pdao=new PickDao();
	String pick_num=request.getParameter("pick_num");
	String movie_num=request.getParameter("movie_num");
	
	//페이징처리
	   int totalCount; //내가 pick한 영화 총 갯수
	   int totalPage; //총 페이지 수
	   int startPage; //각 블럭의 시작 페이지
	   int endPage; //각 블럭의 끝 페이지
	   int start; //각 페이지의 시작번호
	   int perPage=8; //한 페이지에 보여질 글의 갯수 (5개)
	   int perBlock=5; //보여질 블럭의 갯수 (5개)
	   int currentPage; //현재 페이지
	   
	   
	   totalCount=pdao.myPickCount(user_num);
	      
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
	      
	      List<PickDto> list=pdao.getMyPickList(user_num, start, perPage);
	       
	%>
	
	<script type="text/javascript">
	// pick 제거
	$(function(){
		
		$("#zzim").click(function() {
			   var movie_num = $(this).attr("movie_num");
			   var user_num = $(this).attr("user_num");
			
			   //alert(movie_num+"번 영화, "+user_num+"번 유저");
			   $.ajax({
			      type : "get",
			      dataType : "html",
			      url : "review/pick_delete.jsp",
			      data : {
			         "movie_num" : movie_num,
			         "user_num" : user_num
			      },
			      success : function() {
			         alert("pick이 해제되었습니다")
			         location.reload();
			      }
			
			   });
			});		
	});
	
	
	</script>
	
	<style>
	#zzim:hover{
	font-size:40px;
	}
	</style>
</head>
<body>
	<div class="myinfo_div">
	<%
	int myPickCount=pdao.myPickCount(user_num);
	%>
		<h3 style="margin-left: 450px; margin-bottom:50px;">MYPICK <%=myPickCount %></h3>

		<div id="moviewrap_pick" style="width: 1000px; height: 800px; padding-left: 20px; margin-bottom:-50px;">
			<%		
			if(myPickCount==0){%>
			
			<h3>Pick 영화가 없습니다</h3>

			<%}else{
				
				for (PickDto pdto : list) {
					String movie_poster=pdao.getMoviePoster(pdto.getMovie_num());
					String movie_subject=pdao.getMovieSubJect(pdto.getMovie_num());
					%>
					<div class="pick" style="position: relative;">
						<ul>
							<li>					
							<a href="index.jsp?main=review/review_moviedetail.jsp?movie_num=<%=pdto.getMovie_num()%>"><img src="movie_save/<%=movie_poster %>">
							</a>	
							<span class="glyphicon glyphicon-heart" id="zzim" movie_num="<%=pdto.getMovie_num()%>" user_num="<%=pdto.getUser_num() %>" style="position:absolute; z-index: 1; right: 0; cursor: pointer;"></span>
							</li>
						</ul>
							<h3><%=movie_subject %></h3>
					</div>				
				<%}			
			}%>
		</div>
		
		<button type="button" class="btn btn-default btn-sm"
				onclick="location.href='index.jsp?main=mypage/mypage_form.jsp?user_num=<%=user_num %>'"
			style="float: right; margin-bottom: 10px;">마이페이지</button>
	</div>
	
		<!-- 페이징처리 -->
	<div style="width: 500px; text-align: center;" class="container">
		<ul class="pagination">
	<%  
      //이전
      if(startPage>1){
         %>
			<li><a
				href="index.jsp?main=mypage/login_mypickpage.jsp?currentPage=<%=startPage-1 %>&user_num=<%=user_num%>">이전</a>
			</li>
			<%}
         
         
      for(int pp=startPage;pp<=endPage;pp++){
            
         if(pp==currentPage){
            %>
			<li class="active"><a
				href="index.jsp?main=mypage/login_mypickpage.jsp?currentPage=<%=pp %>&user_num=<%=user_num%>"><%=pp %></a>
			</li>
			<% } else{
            %>
			<li><a
				href="index.jsp?main=mypage/login_mypickpage.jsp?currentPage=<%=pp %>&user_num=<%=user_num%>"><%=pp %></a>
			</li>
			<%}
            
      }
         
      //다음
      if(endPage<totalPage){
         %>
			<li><a
				href="index.jsp?main=mypage/login_mypickpage.jsp?currentPage=<%=endPage+1 %>&user_num=<%=user_num%>">다음</a>
			</li>
			<%}
      %>
		</ul>
	</div>
	
	
</body>
</html>