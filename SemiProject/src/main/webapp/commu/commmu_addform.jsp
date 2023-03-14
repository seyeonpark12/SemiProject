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
<link rel="shortcut icon" type="../layoutimage/x-icon" href="../layout_image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
	
	<script type="text/javascript">
    //이미지 미리보기	
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
            reader.onload = function (e) {
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
</head>

<body>
	<%
	//String category=request.getParameter("commu_category");
	String category="자유";
	%>
		
		<div style="margin: 30px 30px;">
		<form action="commu_addaction.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-bordered" style="width: 800px;">
			<caption><b>일단 게시판</b></caption>
				<tr>
					<td>
					<select style="width: 200px;" name="category" class="form-control" required="required">
						<option value="자유" <%=category.equals("자유")?"selected='selected'":""%>>자유</option>
						<option value="동행" <%=category.equals("동행")?"selected='selected'":""%>>동행</option>
						<option value="나눔" <%=category.equals("나눔")?"selected='selected'":""%>>나눔</option>
					</select>
					</td>
					
					<td>
					<input type="text" name="subject" class="form-control" style="width: 400px;" required="required">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<div>
						<img id="showimg" style=" max-width: 200px; margin-top: 10px; margin-left: 10px;">
						</div>
						<textarea name="content" id="content" required="required" style="width: 100%; height: 400px; border: none;  outline: none;"></textarea>
						<input type="file" name="photo" id="photo" class="form-control" onchange="readURL(this)">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
					<button type="submit" class="btn btn-default">저장</button>
					</td>
				</tr>

			</table>
		</form>
	
	</div>

</body>
</html>