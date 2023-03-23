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

<script type="text/javascript">
	$(function() {
		
		function findid() {
			var frm = document.idfindscreen;

		 	if (frm.user_name.value.length < 1) {
			  alert("이름을 입력해주세요");
			  return;
			 }

			 if (frm.user_hp.value.length != 13) {
				  alert("핸드폰번호를 정확하게 입력해주세요");
				  return;
			 }

		 frm.method = "post";
		 frm.action = "login/login_findidresult.jsp"; //넘어간화면
		 frm.submit();  
		}
		
	});

</script>
</head>
<body>
	<main>
	<form name="idfindscreen" method = "POST">
				<div class = "search-title">
				
				<br><br><br><br>
					<h3>휴대폰 본인확인</h3>
				</div>
			<section class = "form-search">
				<div class = "find-name">
					<label>이름</label>
					<input type="text" name="user_name" class = "btn-name" placeholder = "등록한 이름">
				<br>
				</div>
				<div class = "find-phone">
					<label>휴대폰번호</label>
					<input type="text"  name="user_hp" class = "btn-phone" placeholder = "휴대폰번호를 '-'없이 입력">
				</div>
				<br>
		</section>
		<div class ="btnSearch">
			<input type="button" name="enter" value="찾기"  onClick="findid()">
			<input type="button" name="cancle" value="취소" onClick="history.back()">
	 	</div>
	 </form>
	 </main>
</body>
</html>