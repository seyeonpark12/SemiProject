<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layoutimage/x-icon" href="../layout_image/titlelogo.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet"
>
<link href="css/index.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String user_email = request.getParameter("user_email");
	String user_hp = request.getParameter("user_hp");
	

	UserDao dao = new UserDao();
	String user_id = dao.findId(user_email, user_hp); //아이디를 디비에서 가져옴..실패시 널
	%>

	<form name="idsearch" method="post">
		<%
		if (user_id != null) {
		%>

		<div class="container" style="margin-top: 30px;">
			<div class="found-success">
				
				<div class="found-id">
					<h4>회원님의 아이디는 <%=user_id%> 입니다 </h4>
				</div>
				
			</div>
			<div class="found-login" >
				<input type="button" id="btnLogin" value="로그인" onClick="location.href='index.jsp'" />
			</div>
		</div>
		<%
		} else {
		%>
		<div class="container" style="margin-top: 30px;">
			<div class="found-fail">
				<h4>등록된 아이디가 없습니다</h4>
			</div>
			<div class="found-login">
				<input type="button" id="btnback" value="다시 찾기" onClick="history.back()" /> <input
					type="button" id="btnjoin" value="회원가입" onClick="location.href='index.jsp'"/>
			</div>
		</div>


		<%
		}
		%>
	</form>
</body>
</html>