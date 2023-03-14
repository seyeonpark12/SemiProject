<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WPICK</title>
<link rel="favicon" href="image/titlelogo.ico">
<link rel="shortcut icon" type="image/x-icon" href="image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}
/*버튼 올렸을 때 별*/
#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
/* 버튼 올렸을 때까지의 별 채움  */
#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
/* 별을 클릭했을 때  */
#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 100%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}
</style>
</head>

<body>
	<form class="mb-3" name="myform" id="myform" method="post">
		<fieldset>
			<span class="text-bold">별점을 선택해주세요</span>
			<input type="radio" name="reviewStar" value="5" id="rate1">
			<label for="rate1">★</label>
			<input type="radio" name="reviewStar" value="4" id="rate2">
			<label for="rate2">★</label>
			<input type="radio" name="reviewStar" value="3" id="rate3">
			<label for="rate3">★</label>
			<input type="radio" name="reviewStar" value="2" id="rate4">
			<label for="rate4">★</label>
			<input type="radio" name="reviewStar" value="1" id="rate5">
			<label for="rate5">★</label>
		</fieldset>
		<div>
			<textarea class="col-auto form-control" type="text" id="reviewContents" placeholder="좋은 수강평을 남겨주시면 Cocolo에 큰 힘이 됩니다! 포인트 5000p도 지급!!"></textarea>
		</div>
	</form>
</body>
</html>