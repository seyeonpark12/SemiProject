<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
</head>

<body>

<title>main</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="css/main.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="bodywrap">
	<div class="imgslide">
		<a href="#"><img alt="" src="layout_image/1.png"></a> 
		<a href="#"><img alt="" src="layout_image/2.png"></a> 
		<a href="#"><img alt="" src="layout_image/3.png"></a>
	</div>

		<div id="moviewrap">
			<p class="topname">평점 TOP5 영화</p>
			<article>
				<img src="layout_image/mv.jpg">
				<a>영화제목</a>
			</article>
			
			<article>
				<img src="layout_image/mv.jpg">
				<a>영화제목</a>
			</article>
			
			<article>
				<img src="layout_image/mv.jpg">
				<a>영화제목</a>
			</article>
			
			<article>
				<img src="layout_image/mv.jpg">
				<a>영화제목</a>
			</article>
			
			<article>
				<img src="layout_image/mv.jpg">
				<a>영화제목</a>
			</article>	
		</div>
		
		
		<div id="moviewrap2">
			<p class="topname">BEST PICK</p>
			<article>
				<img src="layout_image/mv.jpg">
				<a>영화제목</a>
			</article>
			
			<article>
				<img src="layout_image/mv.jpg">
				<a>영화제목</a>
			</article>
			
			<article>
				<img src="layout_image/mv.jpg">
				<a>영화제목</a>
			</article>
			
			<article>
				<img src="layout_image/mv.jpg">
				<a>영화제목</a>
			</article>
			
		</div>
		
		
	</div>
</body>
<script type="text/javascript">
	$(".imgslide > a:gt(0)").hide();

	setInterval(function() {
		$('.imgslide a:first-child').fadeOut().next('a').fadeIn().end()
				.appendTo('.imgslide');
	}, 3000);

</html>