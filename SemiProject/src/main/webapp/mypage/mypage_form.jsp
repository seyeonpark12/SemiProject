<%@page import="data.dto.PickDto"%>
<%@page import="data.dao.PickDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.MentDto"%>
<%@page import="data.dao.MentDao"%>
<%@page import="data.dto.CommuDto"%>
<%@page import="data.dao.CommuDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
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

<style type="text/css">
ul {
	list-style: none;
	display: flex;
}

li {
	float: left;
}

#zzim:hover {
	font-size: 40px;
}

a.godetail {
	display: inline-block;
	width: 230px;
	height: 380px;
	margin: 2px;
	padding: 10px;
	overflow: hidden;
}

.poster {
	display: inline-block;
	width: 100%;
	height: 360px;
	overflow: hidden;
	object-fit: cover;
	border-radius: 5px;
}
</style>

<script type="text/javascript">
	

	
	$(function(){

		//일반 회원이 회원 탈퇴
	    $("#userdelete").click(function () {
	        
	        var user_num=$(this).attr("user_num");
	        var a=confirm("탈퇴하시겠습니까?");
	        //alert(a);
	        
	         if(a){
	           location.href="user/userdelete.jsp?user_num="+user_num;
	        }
	        
	     });
		
 		// pick 제거
 		$(document).on("click","#zzim",function(){
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

</head>
<%
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
	
	String loginok = (String) session.getAttribute("loginok");
	String myid = (String) session.getAttribute("myid");
	
	UserDao dao = new UserDao();
	List<UserDto> list=dao.getAllUsers();
	String user_num=request.getParameter("user_num");
	//UserDto dto=dao.getData(user_num);
	
	//커뮤니티 게시글 dao,dto
	CommuDao cdao=new CommuDao();
	String commu_num=request.getParameter("commu_num");
	String commu_category=request.getParameter("commu_category");
	//게시글 리스트
	List<CommuDto> mycommulist=cdao.getMyCommuList(user_num, 0, 4);
	
	//커뮤니티 댓글 dao, dto
	MentDao mdao=new MentDao();
	String ment_num=request.getParameter("ment_num");
	//댓글 리스트
	List<MentDto> mymentlist=mdao.getMyMentList(user_num, 0, 4);
	
	//리뷰 댓글 dao,dto
	ReviewDao rdao=new ReviewDao();
	String review_num=request.getParameter("review_num");
	String movie_num=request.getParameter("movie_num");
	//리뷰리스트
	List<ReviewDto> myreviewlist=rdao.getMyReview(user_num, 0, 4);
	
	//pick dao,dto
	PickDao pdao=new PickDao();
	String pick_num=request.getParameter("pick_num");
	//pick 리스트 
	List<PickDto> mypicklist=pdao.getMyPickList(user_num, 0, 4);
	%>
<body>
	<div class="myinfo_div">
		<table style="width: 700px;">
			<caption>

				<div style="width: 100%; float: left;">
					<h3 style="float: left;">회원정보</h3>
					<div style="margin-top: 30px;">
						<input type="hidden" name="user_num" value="<%=user_num%>">
						<a class="editbtn" style="float: left; margin-left: 480px;"
							href='index.jsp?main=mypage/mypage_myinfoupdate.jsp?user_num=<%=user_num %>'>EDIT</a>
						<a class="editbtn" id="userdelete"
							style="float: left; margin-left: 5px; border: 1px solid red; color: red;"
							user_num=<%=user_num %>>DELETE</a>
					</div>
				</div>
			</caption>
			<%
         for(UserDto dto:list){
         
         if(loginok!=null){
            
            if(dto.getUser_id().equals(myid)){%>

			<tr>
				<th class="myinfo" width="200">이름</th>
				<td class="myinfo" width="500">&nbsp;&nbsp;&nbsp;<%=dto.getUser_name() %></td>
			</tr>
			<tr>
				<th class="myinfo">닉네임</th>
				<td class="myinfo">&nbsp;&nbsp;&nbsp;<%=dto.getUser_nickname() %></td>
			</tr>

			<tr>
				<th class="myinfo">아이디</th>
				<td class="myinfo">&nbsp;&nbsp;&nbsp;<%=dto.getUser_id() %></td>
			</tr>

			<tr>
				<th class="myinfo" width="100">비밀번호</th>
				<td class="myinfo" width="250">&nbsp;&nbsp;&nbsp;<%=dto.getUser_pw() %></td>
			</tr>

			<tr>
				<th class="myinfo">핸드폰번호</th>
				<td class="myinfo">&nbsp;&nbsp;&nbsp;<%=dto.getUser_hp() %></td>
			</tr>

			<tr>
				<th class="myinfo" width="100">주소</th>
				<td class="myinfo" width="250">&nbsp;&nbsp;&nbsp;<%=dto.getUser_addr() %></td>
			</tr>

			<tr>
				<th class="myinfo" width="100">이메일</th>
				<td class="myinfo" width="250">&nbsp;&nbsp;&nbsp;<%=dto.getUser_email() %></td>
			</tr>
			<%}
         }
      }
      %>
		</table>


		<a class="morebtn"
			href='index.jsp?main=mypage/login_mypickpage.jsp?user_num=<%=user_num %>'>+MORE</a>
		<%
		int myPickCount=pdao.myPickCount(user_num);
		%>
		<h3 style="margin-bottom: 30px;">
			MYPICK
			<%=myPickCount %></h3>
		<div id="zzimwrap_pick"
			style="width: 1000px; height: 400px; padding-left: 20px;">
			<%
		if(myPickCount==0){%>

			<h3 style="text-align: center; padding: 200px;">Pick 영화가 없습니다</h3>
			
			<%} else {
				
				for (PickDto pdto : mypicklist) {
					String movie_poster=pdao.getMoviePoster(pdto.getMovie_num());
					String movie_subject=pdao.getMovieSubJect(pdto.getMovie_num());
				%>
			<div class="pick" style="position: relative;">
				<ul>
					<li><a
						href="index.jsp?main=review/review_moviedetail.jsp?movie_num=<%=pdto.getMovie_num()%>"
						class="godetail"> <img src="movie_save/<%=movie_poster %>"
							class="poster">
					</a> <span class="glyphicon glyphicon-heart" id="zzim"
						movie_num="<%=pdto.getMovie_num()%>"
						user_num="<%=pdto.getUser_num() %>"
						style="position: absolute; z-index: 1; right: 0; cursor: pointer;"></span>
						<h3
							style="padding: 10px 20px; font-size: 18px; margin-top: -40px; font-weight: 400;"><%=movie_subject %></h3>
					</li>
				</ul>

			</div>
			<%}			
			}
			%>
		</div>

		<!-- 영화!!!!!! 내가 쓴 리뷰!!!!!!!!!!  -->
		<a class="morebtn"
			href='index.jsp?main=mypage/login_mypage_myreview.jsp?user_num=<%=user_num %>'>+MORE</a>

		<table style="width: 1000px;">
			<input type="hidden" name="user_num" value="<%=user_num %>">
			<input type="hidden" name="review_num" value="<%=review_num %>">
			<input type="hidden" name="movie_num" value="<%=movie_num %>">
			<%
		int myReViewCount=rdao.myReviewCount(user_num);
		%>
			<h3>
				내가 쓴 리뷰
				<%=myReViewCount %></h3>
			<tr class="tr_myinfo">
				<th width="200" class="myinfo">영화제목</th>
				<th width="50" class="myinfo">별점</th>
				<th width="550" class="myinfo">리뷰</th>
				<th width="200" class="myinfo">작성일</th>
			</tr>

			<%
			if(myReViewCount==0){%>
			<tr>
				<td colspan="5" align="center" class="myinfo">
					<h3>등록된 리뷰가 없습니다</h3> <!-- 최대 8개까지만 보이게 하기.. -->
				</td>
			</tr>
			<%}else{
				
				for(ReviewDto rdto:myreviewlist){%>

			<tr>
				<%
					String movie_subject=rdao.getMovieSubject(rdto.getMovie_num());
					%>
				<td align="center" class="myinfo"><span><%=movie_subject %></span>
				</td>

				<td align="center" class="myinfo"><span><%=rdto.getReview_score() %></span>
				</td>

				<td align="center" class="myinfo"><span><a
						href="index.jsp?main=review/review_moviedetail.jsp?movie_num=<%=rdto.getMovie_num()%>"><%=rdto.getReview_content() %></a></span>
				</td>

				<td align="center" class="myinfo"><span><%=sdf.format(rdto.getReview_writeday()) %></span>
				</td>
			</tr>

			<%}
			}
			%>
		</table>

		<!-- 커뮤니티!!!!! 내가 쓴 글!!!! -->
		<a class="morebtn"
			href='index.jsp?main=mypage/login_mypage_mywrite.jsp?user_num=<%=user_num %>'>+MORE</a>
		<table style="width: 1000px;">
			<input type="hidden" name="user_num" value="<%=user_num %>">
			<input type="hidden" name="commu_num" value="<%=commu_num %>">
			<%
		int myCommuCount=cdao.myCommuCount(user_num);
		%>
			<h3>
				내가 쓴 글
				<%=myCommuCount %></h3>
			<tr class="tr_myinfo">
				<th width="200" class="myinfo">카테고리</th>
				<th width="600" class="myinfo">제목</th>
				<th width="200" class="myinfo">작성일</th>
			</tr>

			<%
			if(myCommuCount==0){%>

			<tr>
				<td colspan="5" align="center" class="myinfo">
					<h3>작성한 게시글이 없습니다</h3> <!-- 최대 8개까지만 보이게 하기.. -->
				</td>
			</tr>

			<%}else{
				
				for(CommuDto cdto:mycommulist){%>
			<tr>
				<td align="center" class="myinfo"><span><%=cdto.getCommu_category() %></span>
				</td>

				<td align="center" class="myinfo"><span><a
						href="index.jsp?main=commu/commu_detail.jsp?commu_num=<%=cdto.getCommu_num()%>"><%=cdto.getCommu_subject() %></a></span>
				</td>

				<td align="center" class="myinfo"><%=sdf.format(cdto.getCommu_writeday()) %></td>
			</tr>
			<%}
			}
			%>
		</table>

		<!-- 커뮤니티!!!!!! 내가 쓴 댓글!!!!!!!!!!!!! -->
		<a class="morebtn"
			href='index.jsp?main=mypage/login_mypage_mycomment.jsp?user_num=<%=user_num %>'>+MORE</a>

		<table style="width: 1000px;">
			<input type="hidden" name="user_num" value="<%=user_num%>">
			<input type="hidden" name="commu_num=" value="<%=commu_num%>">
			<input type="hidden" name="ment_num=" value="<%=ment_num%>">

			<%
		int myMentCount=mdao.myMentCount(user_num);
		%>
			<h3>
				내가 쓴 댓글
				<%=myMentCount %></h3>
			<tr class="tr_myinfo">
				<th width="200" class="myinfo">카테고리</th>
				<th width="600" class="myinfo">댓글</th>
				<th width="200" class="myinfo">작성일</th>
			</tr>

			<%
			if(myMentCount==0){%>

			<tr>
				<td colspan="5" align="center" class="myinfo">
					<h3>작성한 댓글이 없습니다</h3> <!-- 최대 8개까지만 보이게 하기.. -->
				</td>
			</tr>

			<%}else{
				
				for(MentDto mdto:mymentlist){%>
			<tr>
				<td align="center" class="myinfo">
					<%
							String category=mdao.getCategory(mdto.getCommu_num());
							%> <span><%=category %></span>
				</td>

				<td align="center" class="myinfo"><span><a
						href="index.jsp?main=commu/commu_detail.jsp?commu_num=<%=mdto.getCommu_num()%>"><%=mdto.getMent_content() %></a></span>
				</td>

				<td align="center" class="myinfo"><%=sdf.format(mdto.getMent_writeday()) %></td>
			</tr>
			<%}
			}
			%>
		</table>
	</div>
</body>
</html>