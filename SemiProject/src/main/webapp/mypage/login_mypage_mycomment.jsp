<%@page import="data.dto.MentDto"%>
<%@page import="data.dao.MentDao"%>
<%@page import="data.dto.CommuDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.CommuDao"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link href="css/info.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
	
	<%
	String loginok = (String) session.getAttribute("loginok");
	String myid = (String) session.getAttribute("myid");
	
	UserDao dao = new UserDao();	
	String user_num=request.getParameter("user_num");
	
	CommuDao cdao=new CommuDao();
	String commu_num=request.getParameter("commu_num");
	
	MentDao mdao=new MentDao();
	String ment_num=request.getParameter("ment_num");
	
	  //페이징처리
	   int totalCount; //내가 쓴 글 총 댓글 갯수
	   int totalPage; //총 페이지 수
	   int startPage; //각 블럭의 시작 페이지
	   int endPage; //각 블럭의 끝 페이지
	   int start; //각 페이지의 시작번호
	   int perPage=8; //한 페이지에 보여질 글의 갯수 (5개)
	   int perBlock=5; //보여질 블럭의 갯수 (5개)
	   int currentPage; //현재 페이지
	   
	   
	   totalCount=mdao.myMentCount(user_num);
	      
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
	      
	      List<MentDto> list=mdao.getMyMentList(user_num, start, perPage);
	       
	      SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd HH:mm");
	
	%>
	
<!-- 삭제 체크 박스 -->
<script type="text/javascript">
	$(function(){
		
		$(".allcheckdelete").click(function(){
			
		var mycheck=$(this).is(":checked"); 
		
		$(".checkdelete").prop("checked", mycheck);
		
		});
		
		$("#mymentdelete").click(function(){
			
			var len=$(".checkdelete:checked").length;
			
			if(len==0){
				alert("한 개 이상의 글을 선택해 주세요");
			}else{
				
				var a=confirm(len+"개의 글을 삭제하시겠습니까?");
				
				//체크된 글의 value를 ment_n 
				var ment_n="";
				var user_num=$("#user_num").val();
				
				$(".checkdelete:checked").each(function(idx){
					
					ment_n+=$(this).val()+",";
					
				});
				
				ment_n=ment_n.substring(0, ment_n.length-1);
				
				if(a==1){
					
					location.href="mypage/mypage_myment_delete.jsp?nums="+ment_n+"&user_num="+user_num;
					//nums는 값이 누적되고 마지막 컴마가 제거된 ment_n
					
				}
			}
		});
		
		
	});
	</script>
</head>
<body>
	
	<div class="myinfo_div">
		<table style="width: 1000px;">
		 <input type="hidden" name="user_num" id="user_num" value="<%=user_num%>"> 
		<input type="hidden" name="commu_num" value="<%=commu_num%>">
		<input type="hidden" name="ment_num" value="<%=ment_num%>">
			<h3>내가 쓴 댓글 <%=totalCount %></h3>
			<tr class="tr_myinfo">
				<th width="30" class="myinfo"><input type="checkbox" class="allcheckdelete"></th>
				<th width="170" class="myinfo">카테고리</th>
				<th width="600" class="myinfo">댓글</th>
				<th width="200" class="myinfo">작성일</th>
			</tr>

			<%
			if(totalCount==0){%>
			
				<tr>
				<td colspan="5" align="center" class="myinfo">
					<h3>작성한 댓글이 없습니다</h3> <!-- 최대 8개까지만 보이게 하기.. -->
				</td>
			</tr>
			
			<%}else{
				
				for(MentDto mdto:list){%>
					<tr>
						<td align="center" class="myinfo">
						<input type="checkbox" class="checkdelete" value="<%=mdto.getMent_num() %>">
						</td>
						
						<td align="center" class="myinfo">
						<span>엉엉카테고리어캐해</span>
						</td>
					
						<td align="center" class="myinfo">						
						<span><a href="index.jsp?main=commu/commu_detail.jsp?commu_num=<%=mdto.getCommu_num()%>" style="float: left;"><%=mdto.getMent_content() %></a></span>
						</td>
						
						<td class="myinfo"><%=sdf.format(mdto.getMent_writeday()) %></td>
					</tr>
				<%}
			}
			%>
		</table>

		<button type="button" class="btn btn-default btn-sm"
				onclick="location.href='index.jsp?main=mypage/mypage_form.jsp?user_num=<%=user_num %>'"
			style="margin-left: 450px; margin-bottom: 10px;">마이페이지</button>
			
		<button type="button" class="btn btn-default btn-sm" id="mymentdelete"
			style="margin-left: 450px; margin-bottom: 10px;">삭제</button>
	</div>
	
	
	
	<!-- 페이징처리 -->
	<div style="width: 500px; text-align: center;" class="container">
		<ul class="pagination">
	<%
         
      //이전
      if(startPage>1){
         %>
			<li><a
				href="index.jsp?main=mypage/login_mypage_mycomment.jsp?currentPage=<%=startPage-1 %>">이전</a>
			</li>
			<%}
         
         
      for(int pp=startPage;pp<=endPage;pp++){
            
         if(pp==currentPage){
            %>
			<li class="active"><a
				href="index.jsp?main=mypage/login_mypage_mycomment.jsp?currentPage=<%=pp %>"><%=pp %></a>
			</li>
			<% } else{
            %>
			<li><a
				href="index.jsp?main=mypage/login_mypage_mycomment.jsp?currentPage=<%=pp %>"><%=pp %></a>
			</li>
			<%}
            
      }
         
      //다음
      if(endPage<totalPage){
         %>
			<li><a
				href="index.jsp?main=mypage/login_mypage_mycomment.jsp?currentPage=<%=endPage+1 %>">다음</a>
			</li>
			<%}
      %>
		</ul>
	</div>
</body>
</html>