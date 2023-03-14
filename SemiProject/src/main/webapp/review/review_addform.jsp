<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layout_image/x-icon" href="../layout_image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
#myform fieldset {
	display: inline-block;
	padding-left:180px;
	border: 0;
	direction: rtl;
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
	<div class="container">
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">평가하기</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">영화제목 넣기</h4>
					</div>
					<div class="modal-score">

						<form action="review_addaction.jsp" class="mb-3" name="myform" id="myform" method="post">
							<fieldset>
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
								<textarea class="col-auto form-control" type="text" id="reviewContents" placeholder="욕설과 비방을 작성 시 강퇴당할 수 있습니다."></textarea>
							</div>
						</form>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="submitContents(this)">저장하기</button>
					</div>
				</div>

			</div>
		</div>

	</div>
</body>
</html>