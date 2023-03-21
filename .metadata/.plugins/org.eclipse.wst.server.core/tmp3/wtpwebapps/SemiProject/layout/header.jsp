<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>header</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="css/header.css" type="text/css" rel="stylesheet">
<!-- 아이콘.. -->
<script src="https://kit.fontawesome.com/7027f21a5f.js" crossorigin="anonymous"></script>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<%
String loginok = (String) session.getAttribute("loginok");
String myid = (String) session.getAttribute("myid");
String saveid = (String) session.getAttribute("saveid");

UserDao dao = new UserDao();
String nickname = dao.getName_id(myid);
String user_num = dao.getNum(myid);
%>

<script type="text/javascript">
	$(function() {

		$("#myBtn").click(function() {
			$("#myModal").modal();
		});

		$("#myBtn2").click(function() {
			$("#myModal2").modal();
		});

		//회원가입 액션으로 넘겨주기
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

		//로그인 액션으로 넘겨주기
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

		//idsearch 불러오기
		$("#search_id")
				.keyup(
						function(event) {

							if (event.which === 13) {

								var search = $(this).val();
								//alert(search);

								location.href = "index.jsp?main=movie/movie_search.jsp?search="
										+ search + "&currentPage=1";
							}
							;
						});

		//엔터로 로그인
		$("#user_pw").keyup(function(event) {

			if (event.which === 13) {

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
			}
			;
		});

		//중복 아이디 체크
		$("#id_check").click(function() {

			var user_id = $("#user_id").val();//user_id에 입력되는 값

			$.ajax({
				url : "user/idsearch.jsp",
				type : "get",
				data : {
					"user_id" : user_id
				},
				dataType : 'json',
				success : function(res) {
					if (res.count == 1) {
						$("#check_result").html('중복된 아이디입니다.');
						$('#check_result').css({
							"color" : "red"
						});
						$("#user_id").val("");
						$("#user_id").focus();

					} else {
						$("#check_result").html('사용가능한 아이디입니다.');
						$('#check_result').css({
							"color" : "green"
						});
					}
				}
			});
		});

		//회원가입 시 비번 일치
		$("#user_pw2").focusout(function() {

			var pw1 = $("#user_pw1").val();
			var pw2 = $("#user_pw2").val();

			if (pw1 == pw2) {
				$("#pw_check").html('비밀번호가 일치합니다.');
				$('#pw_check').css({
					"color" : "green"
				});
			} else {
				$("#pw_check").html('비밀번호가 일치하지 않습니다.');
				$('#pw_check').css({
					"color" : "red"
				});
				$("#user_pw2").val("");
				$("#user_pw2").focus();
			}

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
				<a href="index.jsp?main=layout/main.jsp">
					<img src="layout_image/logo.png">
				</a>
			</div>

			<nav class="menu">
				<ul class="navi">
					<li><a href="index.jsp?main=movie/movie_list.jsp?movie_genre=all&sort=recent&currentPage=1" class="mainmenu">영화</a></li>
					<li><a href="index.jsp?main=commu/commu_totallist.jsp" class="mainmenu">커뮤니티</a></li>
				</ul>
			</nav>

			<form method="post">

				<input type="text" id="search_id" placeholder="검색" class="form-control">
				<input type="hidden" name="search" id="search" search="">
			</form>


			<div class="container">
				<!-- 회원(로그인)모드.. -->
				<%
				if (loginok != null) {

					if (myid.equals("admin")) {
				%>

				<div class="menu2">
					<b style="font-size: 10pt; font-weight: normal; margin-right: 10px;"><%=nickname%>님 로그인중
					</b>
					<button type="button" class="btn btn-default btn-sm" style="width: 80px; margin-right: 10px;" onclick="location.href='login/logoutaction.jsp'">Logout</button>
					<div class="fa-solid fa-user-gear" style="font-size: 20px; line-height: 20px; height: 20px;" onclick="location.href='index.jsp?main=mypage/admin_mypage_form.jsp?user_num=<%=user_num%>'"></div>
				</div>
				<%
				} else {
				%>
				<div class="menu2">
					<b style="font-size: 10pt; font-weight: normal; margin-right: 10px;"><%=nickname%>님 로그인중
					</b>
					<button type="button" class="btn btn-default btn-sm" style="width: 80px; margin-right: 10px;" onclick="location.href='login/logoutaction.jsp'">Logout</button>
					<div class="fa-solid fa-user" style="font-size: 20px; line-height: 20px; height: 20px;" onclick="location.href='index.jsp?main=mypage/mypage_form.jsp?user_num=<%=user_num%>'"></div>
				</div>
				<%
				}
				%>

				<%
				} else {
				%>
				<div class="menu2">
					<button type="button" class="btn btn-default btn-sm" id="myBtn" data-toggle="modal" data-target="#myModal">로그인</button>
					<button type="button" class="btn btn-default btn-sm" style="width: 100px;" id="myBtn2" data-toggle="modal" data-target="#myModal2">회원가입</button>
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

								<h2 align="center">로그인</h2>


							</div>
							<div class="modal-body" style="padding: 40px 50px;">
								<form class="form-horizontal" id="loginfrm" method="post">
									<div class="form-group" style="width: 300px;">

										<br> <br>
										<input type="text" name="user_id" placeholder="ID" class="form-control" required="required" style="width: 300px; background-color: #fafafa" value="">

										<br> <br>
										<input type="password" name="user_pw" id="user_pw" placeholder="PASSWORD" class="form-control" required="required" style="width: 300px; background-color: #fafafa">
										<br>

										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<div class="checkbox">
													<label> <input type="checkbox" name="saveid"> 아이디저장
													</label>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="button" class="btn btn-default" id="login" style="width: 180px;">로그인</button>
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

								<h2 align="center">회원가입</h2>


							</div>
							<div class="modal-body" style="padding: 40px 50px;">
								<form class="form-horizontal" method="post" id="gaipfrm">
									<div class="form-group" style="width: 300px;">

										<br> <br>
										<input type="text" name="user_name" placeholder="이름" class="form-control" required="required" style="width: 300px; background-color: #fafafa" value="">


										<br> <br>
										<input type="text" name="user_nickname" placeholder="닉네임" class="form-control" required="required" style="width: 300px; background-color: #fafafa" value="">


										<br> <br>
										<input type="text" name="user_id" id="user_id" placeholder="아이디" class="form-control" required="required" style="width: 70%; background-color: #fafafa">

										<button type="button" class="btn btn-default" style="margin-top: -55px; margin-left: 220px;" id="id_check">중복확인</button>

										<div id="check_result"></div>

										<br> <br>
										<input type="password" name="user_pw" id="user_pw1" placeholder="비밀번호" class="form-control" required="required" style="width: 300px; background-color: #fafafa">
										<br> <br>
										<input type="password" name="user_pw2" id="user_pw2" placeholder="비밀번호확인" class="form-control" required="required" style="width: 300px; background-color: #fafafa">
										<div id="pw_check"></div>


										<br>
										<br>
										<input type="text" name="user_hp" placeholder="휴대번호" class="form-control" required="required" style="width: 300px; background-color: #fafafa" value="">

										<br> <br>
										<input type="text" name="user_addr" placeholder="주소" class="form-control" required="required" style="width: 300px; background-color: #fafafa" value="">

										<br> <br>
										<input type="text" name="user_email" placeholder="이메일" class="form-control" required="required" style="width: 300px; background-color: #fafafa" value="">

										<br> <br>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="button" class="btn btn-default" style="width: 180px;" id="gaip">회원가입</button>
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
		</div>
	</header>

</body>
</html>