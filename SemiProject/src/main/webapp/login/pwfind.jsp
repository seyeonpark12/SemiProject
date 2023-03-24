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
<body>
	<div style="padding: 100px;">
		<h3 align="center" style="font-weight: 600;">비밀번호찾기</h3>


		<form style="padding: 50px; text-align: center;">
			<div class="form-group" style="width: 300px;">

				<input type="text" name="user_id" placeholder="아이디" class="form-control" required="required" style="width: 300px; margin: 10px 0px; background-color: #fafafa">
				<input type="text" name="user_ph" placeholder="전화번호" class="form-control" required="required" style="width: 300px; background-color: #fafafa">


				<div style="padding: 30px;">
					<button type="submit" class="btn btn-default btn-sm" id="login" style="width: 100px; margin: 10px 0px;">비밀번호찾기</button>

					<button type="button" class="btn btn-default btn-sm" style="width: 100px;">뒤로가기</button>
				</div>

			</div>
		</form>


		<div>

			if

			<h3 align="center" style="font-weight: 400;">비밀번호: 비밀번호값</h3>
			else 사용..
			<h3 align="center" style="font-weight: 400;">존재하지않습니다</h3>

		</div>

	</div>

</body>
</html>