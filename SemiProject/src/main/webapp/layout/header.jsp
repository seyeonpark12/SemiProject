<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>header</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link href="css/header.css" type="text/css" rel="stylesheet">
<!-- 아이콘.. -->
<script src="https://kit.fontawesome.com/7027f21a5f.js"
	crossorigin="anonymous"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<%
String loginok = (String) session.getAttribute("loginok");
String myid = (String) session.getAttribute("myid");
String saveid = (String) session.getAttribute("saveid");

UserDao dao = new UserDao();
String nickname = dao.getName_id(myid);
%>
<script type="text/javascript">
	$(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});

		$("#myBtn2").click(function() {
			$("#myModal2").modal();
		});
	});
</script>

<script type="text/javascript">
	$(function() {

		$("#gaip").click(function() {

			var gaipdata = $("#gaipfrm").serialize();
			//alert(formdata);

			$.ajax({

				type : "get",
				dataType : "html",
				url : "user/user_addaction.jsp",
				data : gaipdata,
				success : function() {

					location.reload();
					//$("#myModal").modal();

				}
			});
		});

		$("#login").click(function() {

			var logindata = $("#loginfrm").serialize();
			//alert(logindata);

			$.ajax({

				type : "get",
				dataType : "html",
				url : "login/loginaction.jsp",
				data : logindata,
				success : function() {

					location.reload();

				}
			});

		});

	});
</script>
<body>

	<%
	request.setCharacterEncoding("utf-8");
	%>


	<header>
		<div class="top">

			<div class="logo">
				<a href="index.jsp?main=layout/main.jsp"><img
					src="layout_image/logo.png"></a>
			</div>

			<nav class="menu">
				<ul class="navi">
					<li><a href="index.jsp?main=movie/movie_list.jsp"
						class="mainmenu">영화</a></li>
					<li><a href="index.jsp?main=whatpick/commu_list.jsp"
						class="mainmenu">커뮤니티</a></li>
				</ul>
			</nav>


			<input type="text" name="search" id="search_id"  placeholder="검색"
				class="form-control">

			<div class="container">
				<!-- 회원(로그인)모드.. -->
				<%
				if (loginok != null) {
					
					if(myid.equals("admin")){%>
						
						<div class="menu2">
					<b
						style="font-size: 10pt; font-weight: normal; margin-right: 10px;"><%=nickname%>님
						로그인중
					</b>
					<button type="button" class="btn btn-default btn-sm"
						style="width: 80px; margin-right: 10px;"
						onclick="location.href='login/logoutaction.jsp'">Logout</button>
					<div class="fa-solid fa-user-gear"
						style="font-size: 20px; line-height: 20px; height: 20px;"
						onclick="location.href='index.jsp?main=whatpick/admin_mypage.jsp'"></div>
				</div>
					<%}else{%>
						<div class="menu2">
					<b
						style="font-size: 10pt; font-weight: normal; margin-right: 10px;"><%=nickname%>님
						로그인중</b>
					<button type="button" class="btn btn-default btn-sm"
						style="width: 80px; margin-right: 10px;"
						onclick="location.href='login/logoutaction.jsp'">Logout</button>
					<div class="fa-solid fa-user"
						style="font-size: 20px; line-height: 20px; height: 20px;"
						onclick="location.href='index.jsp?main=whatpick/login_mypage.jsp'"></div>
				</div>
					<%}
				%>

				<%
				} else {
				%>
				<div class="menu2">
					<button type="button" class="btn btn-default btn-sm" id="myBtn"
						data-toggle="modal" data-target="#myModal" style="margin-right:10px;">로그인</button>
					<button type="button" class="btn btn-default btn-sm"
						style="width: 100px;" id="myBtn2" data-toggle="modal"
						data-target="#myModal2">회원가입</button>
				</div>
				<%
				}
				%>


				<!-- Modal 로그인 -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header" style="padding: 50px 50px;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<caption>
									<h2 align="center">로그인</h2>
								</caption>

							</div>
							<div class="modal-body" style="padding: 40px 50px;">
								<form class="form-horizontal" id="loginfrm" method="post">
									<div class="form-group" style="width: 300px;">

										<br> <br> <input type="text" name="user_id"
											placeholder="ID" class="form-control" required="required"
											style="width: 300px; background-color: #fafafa" value="">

										<br> <br> <input type="password" name="user_pw"
											placeholder="PASSWORD" class="form-control"
											required="required"
											style="width: 300px; background-color: #fafafa"> <br>

										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<div class="checkbox">
													<label> <input type="checkbox" name="saveid">
														아이디저장
													</label>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="button" class="btn btn-default" id="login"
													style="width: 180px;">로그인</button>
											</div>
										</div>

									</div>
								</form>
							</div>

						</div>

					</div>
				</div>
				<!-- Modal 끝 -->


				<!-- Modal 회원가입-->
				<div class="modal fade" name="myModal2" id="myModal2" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header" style="padding: 35px 50px;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<caption>
									<h2 align="center">회원가입</h2>
								</caption>

							</div>
							<div class="modal-body" style="padding: 40px 50px;">
								<form class="form-horizontal" method="post" id="gaipfrm">
									<div class="form-group" style="width: 300px;">

										<br> <br> <input type="text" name="user_name"
											placeholder="이름" class="form-control" required="required"
											style="width: 300px; background-color: #fafafa" value="">


										<br> <br> <input type="text" name="user_nickname"
											placeholder="닉네임" class="form-control" required="required"
											style="width: 300px; background-color: #fafafa" value="">


										<br> <br> <input type="text" name="user_id"
											placeholder="아이디" class="form-control" required="required"
											style="width: 70%; background-color: #fafafa" value="">

										<button type="button" class="btn btn-default"
											style="margin-top: -55px; margin-left: 220px;">중복확인</button>

										<br> <br> <input type="password" name="user_pw"
											placeholder="비밀번호" class="form-control" required="required"
											style="width: 300px; background-color: #fafafa"> <br>
										<br> <input type="password" name="user_pw2"
											placeholder="비밀번호확인" class="form-control" required="required"
											style="width: 300px; background-color: #fafafa"> <br>
										<br> <input type="text" name="user_hp" placeholder="휴대번호"
											class="form-control" required="required"
											style="width: 300px; background-color: #fafafa" value="">

										<br> <br> <input type="text" name="user_addr"
											placeholder="주소" class="form-control" required="required"
											style="width: 300px; background-color: #fafafa" value="">

										<br> <br> <input type="text" name="user_email"
											placeholder="이메일" class="form-control" required="required"
											style="width: 300px; background-color: #fafafa" value="">

										<br> <br>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="button" class="btn btn-default"
													style="width: 180px;" id="gaip">회원가입</button>
											</div>
										</div>

									</div>
								</form>
							</div>

						</div>

					</div>
				</div>
				<!-- Modal2 끝 -->

			</div>
	</header>

</body>
</html>