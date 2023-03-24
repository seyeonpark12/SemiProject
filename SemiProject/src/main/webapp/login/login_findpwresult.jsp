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
	String user_id = request.getParameter("user_id");
	String user_hp = request.getParameter("user_hp");

	UserDao dao = new UserDao();
	String user_pw = dao.findPw(user_id, user_hp); //비밀번호를 디비에서 가져옴..실패시 널
	%>

	<form name="idsearch" method="post">
		<%
		if (user_pw != null) {
		%>

		<div class="container">
			<div class="found-success">
				
				<div class="found-id" style="margin-top: 30px;">
					<h4>회원님의 비밀번호는 <%=user_pw%> 입니다</h4>
				</div>
				
			</div>
			<div class="found-login">
				<input type="button" id="btnLogin" value="로그인" onClick="location.href='index.jsp'" />
			</div>
		</div>
		<%
		} else {
		%>
		<div class="container" style="margin-top: 30px;">
			<div class="found-fail">
				<h4>이메일과 전화번호가 일치하지 않습니다</h4>
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