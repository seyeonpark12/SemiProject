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

	$(function(){
		
		//id중복체크
		$("#btncheck").click(function(){
			//id읽기
			var user_id=$("#user_id").val();
			//alert(user_id);
			
			$.ajax({
				type:"get",
				url:"user/idsearch.jsp",
				dataType:"json",
				data:{"user_id":user_id},
				success:function(res){
					
					//consol.log(res.count);
					if(res.count==1){
						//alert("이미가입된 아이디입니다 \n 다시 입력해 주세요");
						$("span.idsuccess").text("가입불가");
						$("#user_id").val('');
						$("#user_id").focus();
						
						}else{
							//alert("가입이 가능한 아이디입니다");
							$("span.idsuccess").text("가입가능");
						}
					
				}
				
			});
		});
		
		
		//이메일
		$("#selEmail").change(function() {
			if($(this).val()=='-'){
				$("#user_email2").val('');
			}else{
				$("#user_email2").val($(this).val());
			}
			
		});
		
		
	});
		//--------------------이메일
	
	
	//비밀번호 확인
	function passcheck(f){
		
		if(f.user_pass.value!=f.user_pass2.value){
			alert("비밀번호가 서로 다릅니다");
			
			f.user_pass.value="";
			f.user_pass2.value="";
			
			return false;//액션이 호출되지 않게 하는거
		}
		
	}

</script>
</head>
<body>

	<form action="../user/addaction.jsp" method="post" class="form-inline"
	onsubmit="return passcheck(this)" name="f">
	
		<table class="table table-bordered" style="width: 500px;">
			<caption>
				<b>회원가입</b>
			</caption>
			<tr>
				<th width="100" bgcolor="#aaa">아이디</th>
				<td><input type="text" name="user_id" id="user_id" class="form-control"
				required="required" style="width: 120px;">
				
				<button type="button" class="btn btn-danger" id="btncheck">중복체크</button>
				<span class="idsuccess"></span>
				</td>
			</tr>
			
			<tr>
			<th width="100" bgcolor="#aaa">비밀번호</th>
				<td>
				<input type="password" name="user_pw" id="user_pw" class="form-control"
				required="required" style="width: 120px;" placeholder="비밀번호">
				
				<input type="password" name="user_pass2" id="user_pass2" class="form-control"
				required="required" style="width: 120px;" placeholder="비밀번호 확인">
				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">이름</th>
				<td>
				<input type="text" name="user_name" id="user_name" class="form-control"
				required="required" style="width: 120px;">
				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">핸드폰</th>
				<td>
				<input type="text" name="user_hp" id="user_hp" class="form-control"
				required="required" style="width: 200px;">
				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">닉네임</th>
				<td>
				<input type="text" name="user_nickname" id="user_nickname" class="form-control"
				required="required" style="width: 200px;">
				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">주소</th>
				<td>
				<input type="text" name="user_addr" id="user_addr" class="form-control"
				required="required" style="width: 400px;">
				</td>
			</tr>
			
			<tr>
			<th width="100" bgcolor="#aaa">이메일</th>
			<td>
				<input type="text" name="user_email" id="user_email" class="form-control"
				required="required" style="width: 120px;"> @ 
				
				<input type="text" name="user_email2" id="user_email2" class="form-control"
				required="required" style="width: 120px;">	
				
				<select id="selEmail" class="form-control">
				<option value="-">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.net">gmail.net</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				</select>
			</td>
			</tr>
			
			<tr>
			<td colspan="2" align="center">
			<button type="submit" class="btn btn-default"
			style="width: 100px;">저장하기</button>
			<button type="reset" class="btn btn-default"
			style="width: 100px;">초기화</button>
			</td>
			</tr>
		</table>
	</form>

</body>
</html>