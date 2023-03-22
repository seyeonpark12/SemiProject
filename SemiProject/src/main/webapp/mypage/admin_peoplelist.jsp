<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="java.util.List"%>
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
<link href="css/info.css" type="text/css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<!-- 관리자 체크박스 -->
<script type="text/javascript">
	$(function() {

		$(".allcheckdelete").click(function() {

			var admincheck = $(this).is(":checked");

			$(".checkdelete").prop("checked", admincheck);
		});

		$("#admindelete").click(function() {

			var len = $(".checkdelete:checked").length; //체크 된 수(길이)를 len

			if (len == 0) {
				alert("한 명 이상의 회원을 선택해 주세요");
			} else {

				var a = confirm(len + "명의 회원을 삭제하시겠습니까?");

				//체크된 글의 value를 commu_n 
				var user_n = "";

				$(".checkdelete:checked").each(function(idx) {

					user_n += $(this).val() + ",";

				});

				user_n = user_n.substring(0, user_n.length - 1);

				if (a == 1) {
					$.ajax({
						type : "get",
						dataType : "html",
						url : "mypage/admin_admincheckdelete.jsp",
						data : {
							"user_n" : user_n
						},
						success : function() {
							location.reload();
						}

					});
				}

			}
		});

	});
</script>

</head>
<body>
	<%
	//로그인 세션
	String loginok = (String) session.getAttribute("loginok");
	//아이디 myid
	String myid = (String) session.getAttribute("myid");

	UserDao udao = new UserDao();

	//페이징처리
	int totalCount; //총 데이터 수
	int totalPage; //총 페이지 수
	int startPage; //각 블럭의 시작 페이지
	int endPage; //각 블럭의 끝 페이지
	int start; //각 페이지의 시작번호
	int perPage = 8; //한 페이지에 보여질 글의 갯수 (8개)
	int perBlock = 5; //보여질 블럭의 갯수 (5개)
	int currentPage; //현재 페이지
	int no = 1;

	//총 갯수 가져오기
	totalCount = udao.getUserTotal();

	//현재 페이지 번호 읽기
	if (request.getParameter("currentPage") == null)
		currentPage = 1;
	else
		currentPage = Integer.parseInt(request.getParameter("currentPage"));

	//총 페이지 갯수
	totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

	//각 블럭의 시작 페이지 
	startPage = (currentPage - 1) / perBlock * perBlock + 1;
	endPage = startPage + perBlock - 1;

	if (endPage > totalPage)
		endPage = totalPage;

	//각 페이지에서 불러 올 시작번호
	start = (currentPage - 1) * perPage;

	List<UserDto> list = udao.getAllAdminUsers(start, perPage);
	%>

	<div class="myinfo_div">
		<table style="width: 1000px;">
			<h3>회원목록</h3>

			<tr class="tr_myinfo">

				<%
				//관리자삭제 전체선택
				if (loginok != null) {
					if (myid.equals("admin")) {
				%>
				<th width="30" class="myinfo"><input type="checkbox"
					class="allcheckdelete"></th>
				<%
				}
				}
				%>
				<th width="30" class="myinfo">NO</th>
				<th width="100" class="myinfo">이름</th>
				<th width="100" class="myinfo">닉네임</th>
				<th width="100" class="myinfo">아이디</th>
				<th width="200" class="myinfo">비밀번호</th>
				<th width="150" class="myinfo">휴대전화</th>
				<th width="200" class="myinfo">주소</th>
				<th width="100" class="myinfo">가입날짜</th>
			</tr>
			<%
			for (UserDto udto : list) {
			%>

			<tr class="tr_myinfo">
				<%
				//관리자삭제 개별선택
				if (loginok != null) {
					if (myid.equals("admin")) {
				%>
				<td class="myinfo"><input type="checkbox" class="checkdelete"
					value="<%=udto.getUser_num()%>"></td>
				<%
				}
				}
				%>
				<td class="myinfo"><%=no%></td>
				<td class="myinfo"><%=udto.getUser_name()%></td>
				<td class="myinfo"><%=udto.getUser_nickname()%></td>
				<td class="myinfo"><%=udto.getUser_id()%></td>
				<td class="myinfo"><%=udto.getUser_pw()%></td>
				<td class="myinfo"><%=udto.getUser_hp()%></td>
				<td class="myinfo"><%=udto.getUser_addr()%></td>
				<td class="myinfo"><%=udto.getUser_gaip()%></td>
			</tr>
			<%
			no++;
			}
			%>
		</table>

	</div>
	<div style="float: right;">
		<button type="button" class="btn btn-default btn-sm" id="admindelete"
			style="margin-left: -400px; margin-bottom: 10px;">삭제</button>

		<button type="button" class="btn btn-default btn-sm"
			onclick="location.href='index.jsp?main=mypage/admin_mypage_form.jsp'"
			style="margin-bottom: 10px; margin-right: 10px;">관리자페이지</button>
	</div>
	<!-- 페이징처리 -->
	<div style="width: 500px; text-align: center;" class="container">
		<ul class="pagination">
			<%
			//이전
			if (startPage > 1) {
			%>
			<li><a
				href="index.jsp?main=mypage/admin_peoplelist.jsp?currentPage=<%=startPage - 1%>">이전</a>
			</li>
			<%
			}

			for (int pp = startPage; pp <= endPage; pp++) {

			if (pp == currentPage) {
			%>
			<li class="active"><a
				href="index.jsp?main=mypage/admin_peoplelist.jsp?currentPage=<%=pp%>"><%=pp%></a>
			</li>
			<%
			} else {
			%>
			<li><a
				href="index.jsp?main=mypage/admin_peoplelist.jsp?currentPage=<%=pp%>"><%=pp%></a>
			</li>
			<%
			}

			}

			//다음
			if (endPage < totalPage) {
			%>
			<li><a
				href="index.jsp?main=mypage/admin_peoplelist.jsp?currentPage=<%=endPage + 1%>">다음</a>
			</li>
			<%
			}
			%>
		</ul>
	</div>

</body>
</html>