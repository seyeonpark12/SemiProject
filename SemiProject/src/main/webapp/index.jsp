<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="image/titlelogo.ico">
<link rel="shortcut icon" type="image/x-icon"
	href="layout_image/titlelogo.ico">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" />
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">
*, :after, :before {
	box-sizing: border-box;
	margin: 0;
}

.sidebar {
	margin: 0 auto;
	width: 110px;
	height: 36%;
	line-height: 30%;
	border: 1px solid #653491;
	border-radius: 20px;
	position: fixed;
	top: 200px;
	right: 16px;
	overflow-x: hidden;
	padding: 20px 0;
	position: fixed;
	background-color: #fdfdfc;
}

.sb_btn {
	margin: 0 auto;
	width: 25px;
	height: 25px;
	background-color: #CBB6D9;
	border: none;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	padding: 10px 0;
}

.preimg_content {
	padding: 10px;
}

.preshow {
	visibility: visible;
	height: 100px;
}


.prehide {
	visibility: hidden;
	height:0px;
}


</style>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:"get",
		dataType:"html",
		url:"cookie/cookie_create.jsp",
		success:function(){
			//console.log("실행");
		}
	})
})
</script>

</head>
<%
String mainPage = "layout/main.jsp";

//메인페이지인지 확인하는변수(0이면 메인페이지, 1이면 다른페이지)
int ismain=0;

//url을 통해서 main값을 읽어서 메인페이지에 출력을한다
if (request.getParameter("main") != null) 
{	
	mainPage = request.getParameter("main");
	
	if(request.getParameter("main").contains("main")){
		
		ismain=0;
		
	}else{
		//다른페이지
		ismain=1;
	}

}
String root = request.getContextPath();
%>

<body>
	<div class="layout header">
		<jsp:include page="layout/header.jsp"></jsp:include>

	</div>

	<div class="layout main">
		<jsp:include page="<%=mainPage%>" />
	</div>

	<footer style="top: 200px;">
		<jsp:include page="layout/footer.html"></jsp:include>
	</footer>


	<a href="#site-header" class="fa-solid fa-angle-up" id="tothetop"
		style="position: fixed; bottom: 6rem; font-size: 30px; right: 6rem; color: #CBB6D9; cursor: pointer;">
	</a>

	<!-- 사이드 바 -->

	<div class="sidebar" style="text-align: center;">

		<div style="height: 13%;">
			<p>최근본영화</p>
		</div>
		<div style="height: 10%;">
			<button class="sb_btn up">
				<i class="fa-solid fa-angle-up"></i>
			</button>

		</div>

		<div class="preimg_content" style="margin-top:10px; text-align:center;">
		
		
<!-- 			<div class="preshow preimg1">
				<a><img src="layout_image/먼훗날우리.jpeg" style="height: 100%:"></a>
			</div>

			<div class="prehide">
				<a><img src="layout_image/작은아씨들.jpeg" style="height: 100%:"></a>

			</div>

			<div class="prehide preimg3">
				<a><img src="layout_image/콜미바이유어네임.jpeg" style="height: 100%:"></a>

			</div> -->
		
		</div>

		<div style="height: 10%;">
			<button class="sb_btn down">
				<i class="fa-solid fa-angle-down"></i>
			</button>
		</div>


	</div>


	<script type="text/javascript">
		jQuery('#tothetop').click(function() {
			var htmloffset = jQuery('html').offset();
			jQuery('html, body').animate({
				scrollTop : htmloffset.top
			}, 400);
		});

		
		
		//ajax로 최근에 읽은 영화 읽어오기
		$.ajax({
			type:"post",
			dataType:"json",
			url:"cookie/cookie_get.jsp",
			success:function(res){
				var html="";
				
				var img_arr=res.reverse();
				
				$.each(img_arr,function(i,ele){
		            //console.log(ele.item);
		            
		            if(i==0&&i<res.length-1){
		               html+="<div class = 'preshow preimg1'>";
		               html+="<a><img src='movie_save/"+ele.movie_num+"' style='height: 50px; width:50px;'></a>"
		               html+="</div>";
		            }else if(i==0){
		               html+="<div class = 'preshow preimg1 preimg3'>";
		               html+="<a><img src='movie_save/"+ele.movie_num+"' style='height: 50px;  width:50px;'></a>"
		               html+="</div>";
		            }else if(i<res.length-1){
		               html+="<div class = 'prehide'>";
		               html+="<a><img src='movie_save/"+ele.movie_num+"' style='height: 50px;  width:50px;'></a>"
		               html+="</div>";
		            }else{
		               html+="<div class = 'prehide preimg3'>";
		               html+="<a><img src='movie_save/"+ele.movie_num+"' style='height: 50px;  width:50px;'></a>"
		               html+="</div>";
		            }
		         });
		         
		         $(".preimg_content").html(html);
			}
		})
		
		$(function() {
			$(".up").click(function() {

				var cur = $(".preshow");

				if (!cur.hasClass("preimg1")) {

					var pre = $(".preshow").prev();

					cur.addClass("prehide");
					pre.addClass("preshow");
					pre.removeClass("prehide");
					cur.removeClass("preshow");

				}

			});

			$(".down").click(function() {

				var cur = $(".preshow");

				if (!cur.hasClass("preimg3")) {

					var pre = $(".preshow").next();

					cur.addClass("prehide");
					pre.addClass("preshow");
					pre.removeClass("prehide");
					cur.removeClass("preshow");

				}
			});

		});
		
		
		
		var scrollPosition = window.scrollY || document.documentElement.scrollTop;
		   console.log(scrollPosition);
		   
		 //최초 실행시 스크롤 위치가 위에 있으면 사이드바 없애기
		   <%
		   if(ismain==0){%>
		      if(scrollPosition<600){
		          //$(".sidebar").css("margin-top","300px");
		          $(".sidebar").hide();
		       }   
		   <%}%>
		   
		   //스크롤 이벤트(사이드바)
		   window.addEventListener('scroll', function(){
		      //console.log('123');
		      scrollPosition = window.scrollY || document.documentElement.scrollTop;
		      
		      <%if(ismain==0){%>
		         if(scrollPosition<600){
		               //$(".sidebar").css("margin-top","300px");
		               $(".sidebar").hide();
		           }else{
		                //$(".sidebar").css("margin-top","0px");
		                $(".sidebar").show();
		           }
		      <%}%>
		      
		   });
		   
		   
		   
	</script>


</body>
</html>