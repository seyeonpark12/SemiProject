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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<br> <br>
		<caption>
			<h3 align="center">회원정보수정</h3>
		</caption>

		<div class="modal-body" style="padding: 10px 635px;">
			<form class="form-horizontal" action="login/loginaction.jsp"
				method="post">
				<div class="form-group" style="width: 300px;">

					<br> <br> <input type="text" name="name" placeholder="이름"
						class="form-control" required="required"
						style="width: 300px; background-color: #FAF7F7" value="">


					<br> <br> <input type="text" name="nickname"
						placeholder="닉네임" class="form-control" required="required"
						style="width: 300px; background-color: #FAF7F7" value="">


					<br> <br> <input type="text" name="id" placeholder="아이디"
						class="form-control" required="required"
						style="width: 300px; background-color: #FAF7F7" value="">



					<br> <br> <input type="password" name="pass"
						placeholder="비밀번호" class="form-control" required="required"
						style="width: 300px; background-color: #FAF7F7"> <br>
					<br> <input type="password" name="pass" placeholder="비밀번호확인"
						class="form-control" required="required"
						style="width: 300px; background-color: #FAF7F7"> <br>
					<br> <input type="text" name="hp" placeholder="휴대번호"
						class="form-control" required="required"
						style="width: 300px; background-color: #FAF7F7" value="">

					<br> <br> <input type="text" name="addr" placeholder="주소"
						class="form-control" required="required"
						style="width: 300px; background-color: #FAF7F7" value="">
					<br> <br> <input type="text" name="addr"
						class="form-control" required="required"
						style="width: 300px; background-color: #FAF7F7" value="">

					<br> <br> <input type="text" name="email"
						placeholder="이메일" class="form-control" required="required"
						style="width: 300px; background-color: #FAF7F7" value="">

					<br> <br>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default"
								style="width: 180px;">정보수정</button>
						</div>
						<br>
						<button type="button" class="btn btn-default"
							onclick="location.href='index.jsp?main=mypage/mypage_form.jsp'"
							style="float: right; margin-right: 125px; margin-top: 20px;">마이페이지</button>
					</div>

				</div>
			</form>
		</div>

	</div>
</body>
</html>