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

<link href="css/info.css" type="text/css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">
a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>

<%
String loginok = (String) session.getAttribute("loginok");
String myid = (String) session.getAttribute("myid");

UserDao udao = new UserDao();
List<UserDto> list=udao.getAllUsers();

String user_num=request.getParameter("user_num");
UserDto dto=udao.getData(user_num);
int no=1;
//UserDto dto=dao.getData(user_num);

//커뮤니티 dao,dto
CommuDao cdao=new CommuDao();

List<UserDto> list2 = udao.getAllAdminUsers(0,4);

%>

<body>
	<div class="myinfo_div">
		<table style="width: 1000px;">

			<h3>관리자정보</h3>

			<a class="editbtn"
				href='index.jsp?main=mypage/admin_updateform.jsp?user_num=<%=user_num %>'">EDIT</a>


			<input type="hidden" name="user_num" value="<%=user_num%>">




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

		</table>

		<a class="morebtn" href='index.jsp?main=mypage/admin_peoplelist.jsp'">+MORE</a>

		<table style="width: 1000px; text-align:center;">
			<h3>회원목록</h3>
			<tr class="tr_myinfo">
				<th width="50" class="myinfo">NO</th>
				<th width="100" class="myinfo">이름</th>
				<th width="100" class="myinfo">닉네임</th>
				<th width="100" class="myinfo">아이디</th>
				<th width="200" class="myinfo">비밀번호</th>
				<th width="150" class="myinfo">휴대전화</th>
				<th width="200" class="myinfo">주소</th>
				<th width="100" class="myinfo">가입날짜</th>
			</tr>
			<%
         for (UserDto udto : list2) {
         %>

			<tr class="tr_myinfo">
				<td class="myinfo"><%=no%></td>
				<td class="myinfo"><%=udto.getUser_name()%></td>
				<td class="myinfo"><%=udto.getUser_nickname()%></td>
				<td class="myinfo"><%=udto.getUser_id()%></td>
				<td class="myinfo"><%=udto.getUser_pw()%></td>
				<td class="myinfo"><%=udto.getUser_hp()%></td>
				<td class="myinfo"><%=udto.getUser_addr()%></td>
				<td class="myinfo"><%=udto.getUser_gaip()%></td>
			</tr>
			<%
         no++;
         }
         %>
		</table>

	</div>
</body>
</html>