<%@page import="data.dao.CommuDao"%>
<%@page import="data.dto.CommuDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layoutimage/x-icon"
	href="../layout_image/titlelogo.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<script type="text/javascript">
	//이미지 미리보기   
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
			reader.onload = function(e) {
				//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
				$('#showimg').attr('src', e.target.result);
				//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				//(아래 코드에서 읽어들인 dataURL형식)
			}
			reader.readAsDataURL(input.files[0]);
			//File내용을 읽어 dataURL형식의 문자열로 저장
		}

	}
</script>


<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
	list-style: none;
	font-family: "Noto Sans KR";
	color: black;
}

.mv_subject {
	font-size: 33px;
	font-weight: 700;
	letter-spacing: -1.2px;
	line-height: 41px;
}

.mv_content {
	font-size: 17px;
	font-weight: 400;
	letter-spacing: -0.7px;
	line-height: 22px;
	margin-top: 4px;
	margin-bottom: 10px;
}

input:focus {
	outline: none;
}

.content:focus {
	outline: none;
}
</style>

</head>

<body>

	<%
	String commu_num = request.getParameter("commu_num");
	String currentPage = request.getParameter("currenPage");

	CommuDao dao = new CommuDao();
	CommuDto dto = dao.getCommuData(commu_num);
	%>
	<div style="margin: 30px 30px;">
		<form action="commu/commu_updateaction.jsp" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="commu_num" value="<%=commu_num%>">
			<input type="hidden" name="currentPage" value="<%=currentPage%>">


			<div style="text-align: center; padding: 40px;">
				<b class="mv_content"
					style="display: inline-block; text-align: left; font-size: 20px; font-weight: 600;">게시판
					수정 </b>
			</div>

			<table style="width: 1000px;">

				<tr>
					<td><select style="width: 200px;" name="commu_category"
						class="form-control" required="required">
							<option value="자유" selected="selected">자유</option>
							<option value="동행">동행</option>
							<option value="나눔">나눔</option>
					</select></td>

					<td><input type="text" name="commu_subject"
						class="form-control" style="width: 790px; margin-left: 8px;"
						required="required" value="<%=dto.getCommu_subject()%>"></td>
				</tr>


				<tr>
					<td colspan="2" style="border: 1px solid lightgray;"><img
						id="showimg"
						src="<%=dto.getCommu_photo() == null ? "" : "commu_save/" + dto.getCommu_photo()%>"
						style="max-width: 100%; max-height: 100%; padding: 10px;"> <textarea
							name="commu_content" id="commu_content" required="required"
							style="width: 100%; height: 400px; border: none; outline: none; padding: 10px; overflow: hidden; overflow-wrap: break-word;"><%=dto.getCommu_content()%></textarea> 
							
							<input type="file" name="commu_photo_update" id="commu_photo_update"
						style="margin-top: 15px; height: 40px; margin-top: 6px;"
						class="form-control" onchange="readURL(this)"></td>

				</tr>

				<tr>
					<td colspan="2" align="center" style="padding-top: 50px;">
						<button type="submit" class="btn btn-default">수정</button>
					</td>
				</tr>

			</table>
		</form>

	</div>

</body>
</html>