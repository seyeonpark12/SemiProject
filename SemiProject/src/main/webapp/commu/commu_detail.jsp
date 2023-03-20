<%@page import="data.dto.MentDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MentDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.CommuDto"%>
<%@page import="data.dao.CommuDao"%>
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
<link rel="shortcut icon" type="../layoutimage/x-icon" href="../layout_image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    
<style type="text/css">


*{
   margin: 0 auto;
   padding: 0;
   list-style: none;
   font-family:"Noto Sans KR";
   color: black;
}

.ca_subject {
   font-size: 15px;
   font-weight: 400;
   letter-spacing: -1.2px;
   line-height: 36px;
}

</style>

</head>

<body>
   <%
	//로그인 세션
	String myid=(String)session.getAttribute("myid");
	String loginok=(String)session.getAttribute("loginok");
   
	//commu_num(게시글번호) 받아오기
   String commu_num=request.getParameter("commu_num");
	
   CommuDao dao=new CommuDao();
   
   //조회수 dao
   dao.updateReadCount(commu_num);
   
   //commu_num에 따른 각각의 dto값
   CommuDto dto=dao.getCommuData(commu_num);
   
   //날짜형식
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
   
	//글 쓴 사람의 번호(user_num 받아오기)
	String user_num=request.getParameter("user_num");
	
   //usert dao선언
	UserDao udao=new UserDao();
	
	//글 쓴 사람 id
	String writer_id=udao.getId(dto.getUser_num());
	
   String currentPage=request.getParameter("currentPage");
   
   //댓글 목록 가져오기
   MentDao mdao=new MentDao();
   //commu_num에 따른 댓글리스트
   List<MentDto> mlist=mdao.getAllMent(dto.getCommu_num());
   
   //MentDto mentnum_dto=mdao.getMentData(user_num);
  
   %>

      <br>
      <br>
   <div style="margin: 30px 30px; margin-left: 270px;">
      <form>
      <input type="hidden" name="commu_num" value="<%=commu_num%>">   
      <input type="hidden" name="user_num" value="<%=user_num%>">
      
         <table style="width: 1000px; margin-left:0px;">
            <tr>
               <td width="1000">
                  <b class="ca_subject">카테고리<%=dto.getCommu_category() %></b>
                  <b class="ca_subject" style="margin-left: 100px;">제목<%=dto.getCommu_subject() %></b>
               </td>
            </tr>

            <tr>
               <td width="1000">
                  <b class="ca_subject">작성날짜<%=sdf.format(dto.getCommu_writeday()) %></b>
                  <%
                  String nickname=udao.getName_num(dto.getUser_num());
                  %>
                  <b class="ca_subject" style="margin-left: 100px;">작성자<%=nickname %></b>
                  <b class="ca_subject" style="margin-left: 600px;">조회수<%=dto.getCommu_readcount() %></b></td>
            </tr>
         </table>
      </form>
      <br>
	   
	   
      <div style="width: 1000px; border: 1px solid gray; margin-left: 0px; margin-bottom:30px; padding: 30px;" id="movie_comtent">
         <img alt="" src="commu_save/<%=dto.getCommu_photo()%>" style="max-width: 400px"><br>
         <%=dto.getCommu_content().replace("\n", "<br>") %>   
      </div>
      
      <div style="margin-left:840px;">  
      <% 
      
      if(loginok!=null){
      	
      	if(myid.equals(writer_id)){%>
      
    	  <button type="button" class="btn btn-default" onclick="location.href='#'">수정</button>
          <button type="button" class="btn btn-default" onclick="funcdel(<%=commu_num%>,<%=currentPage%>)">삭제</button>
      
      	<%}else if(myid.equals("admin")){%>
      		<button type="button" class="btn btn-default" onclick="funcdel(<%=commu_num%>,<%=currentPage%>)">삭제</button>
      	<%}
      }
      %>
      <button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=commu/commu_totallist.jsp'">목록</button> 
	  </div>
	  
	  
	  <!-- 삭제 사용자함수 -->
	<script type="text/javascript">
	
		function funcdel(commu_num,currentPage){
			
			var a=confirm("삭제하시겠습니까?");
	
			if(a){
				location.href="commu/commu_delete.jsp?commu_num="+commu_num+"&currentPage="+currentPage;
			}
		}
	</script>
	  
      <h3>댓글</h3>
      
      <div style="width: 1000px; border: 1px solid gray; margin-left: 1px; padding: 30px;" id="movie_comtent">
         <!-- 댓글인서트 -->
         <%
         if(loginok!=null){%>
         	
         	<div>
         		<form action="ment/ment_addaction.jsp" method="post">
         		<input type="hidden" name="commu_num" value="<%=commu_num%>">   
      			<input type="hidden" name="user_num" value="<%=user_num%>">
      			<input type="hidden" name="currentPage" value="<%=currentPage%>">
         		
         		<table>
         			<tr>
         				<td>
         				<textarea name="ment_content" required="required" style="width: 800px; height: 100px; outline: none;"></textarea>
         				</td>
         				
         				<td>
         				<button type="submit" class="btn btn-default">등록</button>
         				</td>
         			</tr>
         		</table>
         		</form>
         	
         	</div>

         <%}
         %>
         
         <!-- 댓글조회 -->
         <div>
         	<table>
         	<%
         	for(MentDto mdto:mlist){%>
         		<tr>
         			<td>
         			<%
                    String mentnickname=udao.getName_num(mdto.getUser_num());
         			String ment_id=udao.getId(mdto.getUser_num());
         			%>
         			<b><%=mentnickname %></b>
         			<%
         			//게시글 작성자가 자기글에 댓글 달았을때 [글쓴이] 표시
         			if(writer_id.equals(ment_id)){%>
         				<span style="color: gray; font-weight: bold;">[글쓴이]</span>
         			<%}
         			%>
         			
         			<span style="font-size: 10pt;"><%=mdto.getMent_content().replace("\n", "<br>") %></span>
         			<span style="font-size: 9pt; color: gray;"><%=sdf.format(mdto.getMent_writeday()) %></span>
         			</td>
         		</tr>
         		
         		<tr>
         			<td>
         			<%
         			//댓글 수정,삭제
         			if(loginok!=null){
         				if(myid.equals(ment_id)){%>
         					<button type="button" class="mentupdate btn btn-default btn-xs" ment_num=<%=mdto.getMent_num() %>>수정</button>
         					<button type="button" class="mentdelete btn btn-default btn-xs" ment_num=<%=mdto.getMent_num() %>>삭제</button>
         					
         				<%}else if(myid.equals("admin")){%>
         					<button type="button" class="mentdelete btn btn-default btn-xs" ment_num=<%=mdto.getMent_num() %>>삭제</button>
         					
         				<%}
         			}
         			%>
         			</td>
         		</tr>
         	<%}
         	%>
         	</table>
         </div>
        
      </div>

   </div>

</body>
</html>