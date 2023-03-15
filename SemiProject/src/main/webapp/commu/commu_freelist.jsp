<%@page import="data.dao.MentDao"%>
<%@page import="data.dao.UserDao"%>
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
<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
	list-style: none;
	font-family: "Noto Sans KR";
	color: black;
}

tr th {
	text-align: center;
}
</style>

   <%
   CommuDao dao=new CommuDao();
   
   String commu_category="자유";

      
   //페이징처리
   int totalCount; //자유게시판 갯수
   int totalPage; //총 페이지 수
   int startPage; //각 블럭의 시작 페이지
   int endPage; //각 블럭의 끝 페이지
   int start; //각 페이지의 시작번호
   int perPage=8; //한 페이지에 보여질 글의 갯수 (5개)
   int perBlock=5; //보여질 블럭의 갯수 (5개)
   int currentPage; //현재 페이지
   
   
   //총 갯수 가져오기
   //totalCount=dao.totalCommuCount();
   
   //자유게시판 갯수
   totalCount=dao.commuCount(commu_category);

      
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
      
      List<CommuDto> list=dao.getCategoryList(commu_category, start, perPage);
       
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
      
      
      //스마트게시판 댓글에 관한 Dao처리
      MentDao mdao=new MentDao();
      
      for(CommuDto dto:list){
   	   
   	   //댓글 변수에 댓글 총 갯수를 넣기 
   	   int mentcount=mdao.getAllMent(dto.getCommu_num()).size();
   	   dto.setAnswerCount(mentcount); 
   	   //CommuDto에 추가한 AnswerCount에 mentcount라고 수정해줌
      }
      
   %>

</head>
<body>

   <%
   //로그인 세션
   //String loginok=(String)session.getAttribute("loginok");
   //아이디 myid
   //String myid=(String)session.getAttribute("myid");
   
   String myid="garlic";
   UserDao udao=new UserDao();
   %>
 
 	<!-- 카테고리  -->
   <div class="category"
      style="width: 1000px; margin-top: 100px; margin-left: 860px;">
      <div style="float: left;">
         <a href="index.jsp?main=commu/commu_totallist.jsp"
            style="font-size: 18px; color: black; padding-right: 10px;">전체
            |</a>
      </div>
      <div style="float: left;">
         <a href="index.jsp?main=commu/commu_freelist.jsp"
            style="font-size: 18px; font-weight: bold; color: black; padding-right: 10px;">자유 |</a>
      </div>
      <div style="float: left;">
         <a href="index.jsp?main=commu/commu_withlist.jsp"
            style="font-size: 18px; color: black; padding-right: 10px;">동행 |</a>
      </div>
      <div style="float: left;">
         <a href="index.jsp?main=commu/commu_sharelist.jsp"
            style="font-size: 18px; color: black; padding-right: 10px;">나눔</a>
      </div>
   </div>
   
   <div style="margin: 30px 30px; padding-left:40px;">
         <br>
         <table class="table table-bordered" style="width: 1000px;">
            <tr>
				<th width="100">카테고리</th>
               <th width="500">제목</th>
               <th width="120">글쓴이</th>
               <th width="100">작성일</th>
               <th width="60">조회수</th>
            </tr>
         
      <%
   
         if(totalCount==0){%>
            <tr>
               <td colspan="5" align="center">
               <h2>등록 된 게시글이 없습니다</h2>
               </td>
            </tr>
         <%}else{
            
            for(CommuDto dto:list){
            
            %>
               
               <tr>
               
               	  <td>
                  <%=dto.getCommu_category() %>
                  </td>
                  
                  <td>
                  <a href="index.jsp?main=commu/commu_detail.jsp?num=<%=dto.getCommu_num()%>&currentPage=<%=currentPage%>"><%=dto.getCommu_subject() %></a>
                  <%
	   				//댓글이 있을 경우 제목 옆에 갯수 나타내기
	   				if(dto.getAnswerCount()>0){%>
	   					<a href="index.jsp?main=commu/commu_detail.jsp?num=<%=dto.getCommu_num()%>&currentPage=<%=currentPage%>" style="color: red;">[<%=dto.getAnswerCount() %>]</a>
	   				<%}
	   				%>
                  </td>
                  
                  <%
                  String nickname=udao.getName_num(dto.getUser_num());
                  %>
                  <td>
                  <%=nickname %>
                  </td>
                  
                  <td><%=sdf.format(dto.getCommu_writeday()) %></td>
                  
                  <td><%=dto.getCommu_readcount() %></td>
               </tr>
               
            <%}
            
            }
            %>
         </table>
    <div style="margin-left:1343spx;">
		<button type="button" class="btn btn-default btn-sm"
			onclick="location.href='index.jsp?main=commu/commu_addform.jsp'">
			<span class="glyphicon glyphicon-pencil"></span>글쓰기
		</button>
	</div>
      </div>
      
 <!-- 페이징처리 -->
   <div style="width: 500px; text-align: center;" class="container">
   <ul class="pagination">
      <%
         
      //이전
      if(startPage>1){
         %>
         <li>
            <a href="index.jsp?main=commu/commu_freelist.jsp?currentPage=<%=startPage-1 %>">이전</a>
         </li>
      <%}
         
         
      for(int pp=startPage;pp<=endPage;pp++){
            
         if(pp==currentPage){
            %>
            <li class="active">
               <a href="index.jsp?main=commu/commu_freelist.jsp?currentPage=<%=pp %>"><%=pp %></a>
            </li>
         <% } else{
            %>
            <li>
               <a href="index.jsp?main=commu/commu_freelist.jsp?currentPage=<%=pp %>"><%=pp %></a>
            </li>
         <%}
            
      }
         
      //다음
      if(endPage<totalPage){
         %>
         <li>
            <a href="index.jsp?main=commu/commu_freelist.jsp?currentPage=<%=endPage+1 %>">다음</a>
         </li>
      <%}
      %>
   </ul>
   </div>
      
   

</body>
</html>