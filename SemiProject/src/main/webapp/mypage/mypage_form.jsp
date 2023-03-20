<%@page import="data.dto.CommuDto"%>
<%@page import="data.dao.CommuDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
<<<<<<< HEAD
   pageEncoding="utf-8"%>
=======
	pageEncoding="utf-8"%>
>>>>>>> 473be456a3e46c26242f977cf4c6d272cd0d531e
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layoutimage/x-icon"
<<<<<<< HEAD
   href="../layout_image/titlelogo.ico">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
   rel="stylesheet">
<link href="css/info.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

</head>
<%
String loginok = (String) session.getAttribute("loginok");
String myid = (String) session.getAttribute("myid");

UserDao dao = new UserDao();
List<UserDto> list = dao.getAllUsers();

String user_num = request.getParameter("user_num");

//UserDto dto=dao.getData(user_num);

//커뮤니티 dao,dto
//CommuDao cdao = new CommuDao();
%>
<body>
   <div class="myinfo_div">
      <table style="width: 700px;">
         <h3>회원정보</h3>
         <a class="editbtn"
            href="index.jsp?main=mypage/mypage_myinfoupdate.jsp?user_num=<%=user_num%>">EDIT</a>
         <input type="hidden" name="user_num" value="<%=user_num%>">

         <%
         for (UserDto dto : list) {

            if (loginok != null) {

               if (dto.getUser_id().equals(myid)) {
         %>

         <tr>
            <th class="myinfo" width="200">이름</th>
            <td class="myinfo" width="500">&nbsp;&nbsp;&nbsp;<%=dto.getUser_name()%></td>
         </tr>
         <tr>
            <th class="myinfo">닉네임</th>
            <td class="myinfo">&nbsp;&nbsp;&nbsp;<%=dto.getUser_nickname()%></td>
         </tr>

         <tr>
            <th class="myinfo">아이디</th>
            <td class="myinfo">&nbsp;&nbsp;&nbsp;<%=dto.getUser_id()%></td>
         </tr>

         <tr>
            <th class="myinfo" width="100">비밀번호</th>
            <td class="myinfo" width="250">&nbsp;&nbsp;&nbsp;<%=dto.getUser_pw()%></td>
         </tr>

         <tr>
            <th class="myinfo">핸드폰번호</th>
            <td class="myinfo">&nbsp;&nbsp;&nbsp;<%=dto.getUser_hp()%></td>
         </tr>

         <tr>
            <th class="myinfo" width="100">주소</th>
            <td class="myinfo" width="250">&nbsp;&nbsp;&nbsp;<%=dto.getUser_addr()%></td>
         </tr>

         <tr>
            <th class="myinfo" width="100">이메일</th>
            <td class="myinfo" width="250">&nbsp;&nbsp;&nbsp;<%=dto.getUser_email()%></td>
         </tr>
         <%
         }
         }
         }
         %>
      </table>


      <a class="morebtn" href='index.jsp?main=mypage/login_mypickpage.jsp'">+MORE</a>

      <h3 style="margin-bottom: 30px;">MYPICK</h3>
      <div id="moviewrap_pick">

         <div class="pick">
            <span class="glyphicon glyphicon-heart" id="zzim"></span>
         </div>

         <!-- 최대 4개까지만 보이게 하기.. -->
      </div>

      <a class="morebtn"
         href='index.jsp?main=mypage/login_mypage_myreview.jsp'">+MORE</a>

      <table style="width: 1000px;">
         <h3>내가 쓴 리뷰보기</h3>
         <tr class="tr_myinfo">
            <th width="200" class="myinfo">영화제목</th>
            <th width="600" class="myinfo">리뷰</th>
            <th width="200" class="myinfo">날짜</th>
         </tr>

         <tr>
            <td colspan="5" align="center" class="myinfo">
               <h3>등록된 게시글이 없습니다</h3> <!-- 최대 8개까지만 보이게 하기.. -->
            </td>
         </tr>
      </table>


      <a class="morebtn"
         href='index.jsp?main=mypage/login_mypage_mywrite.jsp'">+MORE</a>

      <table style="width: 1000px;">
         <h3>내가 쓴 글보기</h3>
         <tr class="tr_myinfo">
            <th width="200" class="myinfo">카테고리</th>
            <th width="800" class="myinfo">제목</th>
         </tr>

         <tr>
            <td colspan="5" align="center" class="myinfo">
               <h3>등록된 게시글이 없습니다</h3> <!-- 최대 8개까지만 보이게 하기.. -->
            </td>
         </tr>
      </table>



      <a class="morebtn"
         href='index.jsp?main=mypage/login_mypage_mycomment.jsp'">+MORE</a>

      <table style="width: 1000px;">
         <h3>내가쓴댓글보기</h3>
         <tr class="tr_myinfo">
            <th width="200" class="myinfo">카테고리</th>
            <th width="800" class="myinfo">제목</th>
         </tr>

         <tr>
            <td colspan="5" align="center" class="myinfo">
               <h3>등록된 게시글이 없습니다</h3> <!-- 최대 8개까지만 보이게 하기.. -->
            </td>
         </tr>
      </table>
   </div>
=======
	href="../layout_image/titlelogo.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link href="css/info.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

</head>
	<%
	String loginok = (String) session.getAttribute("loginok");
	String myid = (String) session.getAttribute("myid");
	
	UserDao dao = new UserDao();
	List<UserDto> list=dao.getAllUsers();
	String user_num=request.getParameter("user_num");
	//UserDto dto=dao.getData(user_num);
	
	//커뮤니티 dao,dto
	CommuDao cdao=new CommuDao();
	String commu_num=request.getParameter("commu_num");

	//게시글 리스트
	List<CommuDto> mycommulist=cdao.getMyCommuList(user_num, 0, 8);
	%>
<body>
	<div class="myinfo_div">
		<table style="width: 700px;">
			<h3>회원정보</h3>
			<a class="editbtn"
				href='index.jsp?main=mypage/mypage_myinfoupdate.jsp?user_num=<%=user_num %>'>EDIT</a>
			<input type="hidden" name="user_num" value="<%=user_num%>">

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


		<a class="morebtn" href='index.jsp?main=mypage/login_mypickpage.jsp'>+MORE</a>
		<h3 style="margin-bottom: 30px;">MYPICK</h3>
		<div id="moviewrap_pick">
			<div class="pick">
				<span class="glyphicon glyphicon-heart" id="zzim"></span>
			</div>
			<!-- 최대 4개까지만 보이게 하기.. -->
		</div>
		<a class="morebtn"
			href='index.jsp?main=mypage/login_mypage_myreview.jsp'>+MORE</a>

		<table style="width: 1000px;">
			<h3>내가 쓴 리뷰</h3>
			<tr class="tr_myinfo">
				<th width="200" class="myinfo">영화제목</th>
				<th width="600" class="myinfo">리뷰</th>
				<th width="200" class="myinfo">날짜</th>
			</tr>

			<tr>
				<td colspan="5" align="center" class="myinfo">
					<h3>등록된 게시글이 없습니다</h3> <!-- 최대 8개까지만 보이게 하기.. -->
				</td>
			</tr>
		</table>

		
		<!-- 커뮤니티!!!!! 내가 쓴 글!!!! -->
		<a class="morebtn"
			href='index.jsp?main=mypage/login_mypage_mywrite.jsp?user_num=<%=user_num %>'>+MORE</a>
		<table style="width: 1000px;">
		<input type="hidden" name="user_num" value="<%=user_num%>">
		<input type="hidden" name="commu_num" value="<%=commu_num%>">
		<%
		int myCommuCount=cdao.myCommuCount(user_num);
		%>
			<h3>내가 쓴 글 <%=myCommuCount %></h3>
			<tr class="tr_myinfo">
				<th width="200" class="myinfo">카테고리</th>
				<th width="800" class="myinfo">제목</th>
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
						<td align="center" class="myinfo">
						<span><%=cdto.getCommu_category() %></span>
						</td>
					
						<td align="center" class="myinfo">						
						<span><a href="index.jsp?main=commu/commu_detail.jsp?commu_num=<%=cdto.getCommu_num()%>"><%=cdto.getCommu_subject() %></a></span>
						</td>
					</tr>
				<%}
			}
			%>
		</table>
		
		
		<!-- 커뮤니티!!!!!! 내가 쓴 댓글!!!!!!!!!!!!! -->
		<a class="morebtn"
			href='index.jsp?main=mypage/login_mypage_mycomment.jsp'>+MORE</a>
		
		<table style="width: 1000px;">
			<h3>내가 쓴 댓글</h3>
			<tr class="tr_myinfo">
				<th width="200" class="myinfo">카테고리</th>
				<th width="800" class="myinfo">제목</th>
			</tr>

			<tr>
				<td colspan="5" align="center" class="myinfo">
					<h3>등록된 게시글이 없습니다</h3> <!-- 최대 8개까지만 보이게 하기.. -->
				</td>
			</tr>
		</table>
	</div>
>>>>>>> 473be456a3e46c26242f977cf4c6d272cd0d531e
</body>
</html>