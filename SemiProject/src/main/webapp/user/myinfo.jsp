<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.UserDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.UserDao"%>
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
</head>
<body>

<%
	//전체멤버 정보 가져오기
	UserDao dao=new UserDao();
	List<UserDto> list=dao.getAllUsers()();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	//세션
	String loginok=(String)session.getAttribute("loginok");
	String myid=(String)session.getAttribute("myid");
	%>
<body>
	<table class="table table-bordered" style="width: 500px; font-size: 12pt;">
		<%
	     for(MemberDto dto:list)
	     {%>
	     
	     <%
	     //로그인중이면서 로그인한 아이디와 같은사람만 보기
	     if(loginok!=null && dto.getId().equals(myid)){%>
	    	 
	    	 <tr>
	    	    <td>
	    	    <%=dto.getName() %><br>
	    	    <%=dto.getUser_id() %><br>
	    	    <%=dto.getHp() %><br>
	    	    <%=dto.getAddr() %><br>
	    	    <%=dto.getEmail() %><br>
	    	    <%=sdf.format(dto.getGaipday()) %><br>
	    	    <div style="float: right;">
	    	    	<button type="button" class="btn btn-default btn-xs" onclick="location.href='index.jsp?main=member/myinfoupdate.jsp?num=<%=dto.getNum()%>'">수정</button>
					<button type="button" class="btn btn-default btn-xs" onclick="location.href='member/myinfodelete.jsp?num=<%=dto.getNum()%>'">탈퇴</button>
	    	     </div>
	    	    </td>
	    	 </tr>
	     <%}
	     %>

	     <%}
	     %>
	</table>
</body>
</html>