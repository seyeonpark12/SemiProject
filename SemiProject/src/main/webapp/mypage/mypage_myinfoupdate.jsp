<%@page import="data.dto.CommuDto"%>
<%@page import="data.dao.CommuDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="css/info.css" type="text/css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	//비밀번호 확인
	//비밀번호 다를때 액션 호출 안되게 해야 함 form에서 onsubmit="return passcheck(this)"
	function passcheck(f) {

		if (f.user_pw.value != f.user_pw2.value) {
			alert("비밀번호가 서로 다릅니다");

			//입력 창들 다시 공란으로 해주고(비밀번호 확인 칸을 빈칸으로 만들어줌)
			f.user_pw2.value = "";

			return false; //비밀번호,비밀번호 확인이 다를 경우 action이 호출되지 않게

		}

	}
</script>
</head>

<%
String loginok = (String) session.getAttribute("loginok");
String myid = (String) session.getAttribute("myid");

UserDao dao = new UserDao();
List<UserDto> list = dao.getAllUsers();

String user_num = request.getParameter("user_num");

UserDto dto = dao.getData(user_num);
%>
<body>
	<div>

		<div class="myinfo_div">
			<form action="mypage/mypage_myinfoupdateaction.jsp" method="post" onsubmit="return passcheck(this)">
				<input type="hidden" name="user_num" value="<%=user_num%>">
				<table style="width: 700px;">
					<h3 align="center">회원정보수정</h3>



					<tr>
						<th class="myinfo" width="200">이름</th>
						<td class="myinfo"><%=dto.getUser_name()%></td>
					</tr>
					<tr>
						<th class="myinfo">닉네임</th>
						<td class="myinfo">
							<input type="text" name="user_nickname" class="form-control" required="required" style="width: 300px; background-color: #fcfcfc" value="<%=dto.getUser_nickname()%>">
						</td>

					</tr>

					<tr>
						<th class="myinfo">아이디</th>
						<td class="myinfo"><%=dto.getUser_id()%></td>
					</tr>

					<tr>
						<th class="myinfo" width="100">비밀번호</th>
						<td class="myinfo">
							<input type="text" name="user_pw" class="form-control" required="required" style="width: 300px; background-color: #fcfcfc" value="<%=dto.getUser_pw()%>">
						</td>
					</tr>


					<tr>
						<th class="myinfo" width="100">비밀번호확인</th>
						<td class="myinfo">
							<input type="text" name="user_pw2" class="form-control" required="required" style="width: 300px; background-color: #fcfcfc" value="">
						</td>
					</tr>

					<tr>
						<th class="myinfo">핸드폰번호</th>
						<td class="myinfo">
							<input type="text" name="user_hp" class="form-control" required="required" style="width: 300px; background-color: #fcfcfc" value="<%=dto.getUser_hp()%>">
						</td>
					</tr>

					<tr>
						<th class="myinfo" width="100">주소</th>
						<td class="myinfo">
							<input type="text" name="user_addr" class="form-control" required="required" style="width: 300px; background-color: #fcfcfc" value="<%=dto.getUser_addr()%>">
						</td>
					</tr>

					<tr>
						<th class="myinfo" width="100">이메일</th>
						<td class="myinfo">
							<input type="text" name="user_email" class="form-control" required="required" style="width: 300px; background-color: #fcfcfc" value="<%=dto.getUser_email()%>">
						</td>
					</tr>

					<tr>
						<td colspan="2" style="text-align: center;">
							<div class="form-group">
								<br>
								<br>
								<br>


								<div style="float: right;">
									<button type="submit" class="btn btn-default btn-sm" style="margin-left: -680px; margin-bottom: 10px;">회원 정보수정</button>

									<button type="button" class="btn btn-default btn-sm" onclick="location.href='index.jsp?main=mypage/mypage_form.jsp'" style="margin-bottom: 10px; margin-right: 10px;">마이페이지</button>
								</div>

							</div>
						</td>
					</tr>



				</table>
			</form>
		</div>
	</div>

</body>
</html>