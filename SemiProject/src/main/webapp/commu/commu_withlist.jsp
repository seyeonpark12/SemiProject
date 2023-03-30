<%@page import="data.dao.MentDao"%>
<%@page import="data.dao.UserDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.CommuDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.CommuDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>commu_withlist</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="css/info.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<style type="text/css">
a:hover {
	text-decoration: none;
}

td.myinfo {
	text-align: center;
}

.nav>li>a, .nav>li>a {
	text-decoration: none;
	color: #653491;;
}

.nav>li>a:focus, .nav>li>a:hover {
	text-decoration: none;
	color: #fff;
	background-color: #CBB6D9;
	border: 0px solid;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,
	.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover
	{
	z-index: 3;
	color: #fff;
	cursor: default;
	background-color: #CBB6D9;
	border-color: #CBB6D9;
}

.pagination>li>a, .pagination>li>a, .pagination>li>span, .pagination>li>span
	{
	z-index: 2;
	color: #CBB6D9;
	background-color: #fff;
	border: 0px solid;
}

.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus,
	.pagination>li>span:hover {
	z-index: 2;
	color: #fff;
	background-color: #ECE6FF;
	border: 0px solid;
}
</style>

<%
CommuDao dao = new CommuDao();

String commu_category = "동행";

//페이징처리
int totalCount; //총 데이터 수
int totalPage; //총 페이지 수
int startPage; //각 블럭의 시작 페이지
int endPage; //각 블럭의 끝 페이지
int start; //각 페이지의 시작번호
int perPage = 8; //한 페이지에 보여질 글의 갯수 (5개)
int perBlock = 5; //보여질 블럭의 갯수 (5개)
int currentPage; //현재 페이지

//총 갯수 가져오기
//totalCount=dao.totalCommuCount();

//자유게시판 갯수
totalCount = dao.commuCount(commu_category);

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

//카테고리별 리스트
List<CommuDto> list = dao.getCategoryList(commu_category, start, perPage);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

//스마트게시판 댓글에 관한 Dao처리
MentDao mdao = new MentDao();

for (CommuDto dto : list) {

	//댓글 변수에 댓글 총 갯수를 넣기 
	int mentcount = mdao.getAllMent(dto.getCommu_num()).size();
	dto.setAnswerCount(mentcount);
	//CommuDto에 추가한 AnswerCount에 mentcount라고 수정해줌
}
%>

<!-- 관리자 체크박스 -->
<script type="text/javascript">
	$(function() {

		$(".allcheckdelete").click(function() {

			var admincheck = $(this).is(":checked");

			$(".checkdelete").prop("checked", admincheck);
		});

		$("#admindelete")
				.click(
						function() {

							var len = $(".checkdelete:checked").length; //체크 된 수(길이)를 len

							if (len == 0) {
								alert("한 개 이상의 글을 선택해 주세요");
							} else {

								var a = confirm(len + "개의 글을 삭제하시겠습니까?");

								//체크된 글의 value를 commu_n 
								var commu_n = "";

								$(".checkdelete:checked").each(function(idx) {

									commu_n += $(this).val() + ",";

								});

								commu_n = commu_n.substring(0,
										commu_n.length - 1);

								if (a == 1) {
									//삭제파일로 전송
									location.href = "commu/commu_admincheckdelete.jsp?nums="
											+ commu_n; //nums는 값이 누적되고 마지막 컴마가 제거된 commu_n
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
	%>
	<div class="category" style="width: 1000px; margin-top: 100px; margin-left: 670px;">

		<div style="float: left;">
			<a href="index.jsp?main=commu/commu_totallist.jsp?category=total" style="font-size: 18px; color: black; padding-right: 10px;">전체 </a>
		</div>
		<div style="float: left;">
			<a href="index.jsp?main=commu/commu_freelist.jsp?category=free" style="font-size: 18px; color: black; padding-right: 10px;">자유 </a>
		</div>
		<div style="float: left;">
			<a href="index.jsp?main=commu/commu_withlist.jsp?category=with" style="font-size: 18px; font-weight: bold; color: #653491; padding-right: 10px;">동행 </a>
		</div>
		<div style="float: left;">
			<a href="index.jsp?main=commu/commu_sharelist.jsp?category=share" style="font-size: 18px; color: black; padding-right: 10px;">나눔</a>
		</div>
	</div>

	<br>
	<div class="myinfo_div">
		<br>

		<table style="width: 1000px;">

			<tr class="tr_myinfo">
				<%
				//관리자삭제 전체선택
				if (loginok != null) {
					if (myid.equals("admin")) {
				%>
				<th width="30" class="myinfo"><input type="checkbox" class="allcheckdelete"></th>
				<%
				}
				}
				%>
				<th width="100" class="myinfo">카테고리</th>
				<th width="500" class="myinfo">제목</th>
				<th width="120" class="myinfo">글쓴이</th>
				<th width="100" class="myinfo">작성일</th>
				<th width="60" class="myinfo">조회수</th>
			</tr>

			<%
			if (totalCount == 0) {
			%>

			<tr class="tr_myinfo">
				<td colspan="5" align="center" class="myinfo">
					<h3>등록된 게시글이 없습니다</h3>
				</td>
			</tr>

			<%
			} else {

			for (CommuDto dto : list) {
			%>
			<tr class="tr_myinfo">

				<%
				//관리자삭제 개별선택
				if (loginok != null) {
					if (myid.equals("admin")) {
				%>
				<td class="myinfo">
					<input type="checkbox" class="checkdelete" value="<%=dto.getCommu_num()%>">
				</td>
				<%
				}
				}
				%>

				<td class="myinfo"><%=dto.getCommu_category()%></td>

				<td class="myinfo">
					<a style="float: left; margin-left: 50px; padding: 0px 5px;" href="index.jsp?main=commu/commu_detail.jsp?category=with&commu_num=<%=dto.getCommu_num()%>&currentPage=<%=currentPage%>"> <%=dto.getCommu_subject()%></a>
					<%
					//이미지 첨부된 경우 아이콘 표시
					if (dto.getCommu_photo() != null) {
					%>
					<img style="float: left; width: 13px; margin-top: 3px; padding: 1px;" src="commu/new_img/photoimg.png">
					<%
					}

					//댓글이 있을 경우 제목 옆에 갯수 나타내기
					if (dto.getAnswerCount() > 0) {
					%>
					<a href="index.jsp?main=commu/commu_detail.jsp?category=with&commu_num=<%=dto.getCommu_num()%>&currentPage=<%=currentPage%>" style="float: left; color: red;">[<%=dto.getAnswerCount()%>]
					</a>
					<%
					}

					//오늘 올라온 글이면 N icon
					String inpuDate = sdf.format(dto.getCommu_writeday());
					String now = sdf.format(new java.util.Date());

					if (inpuDate.equals(now)) {
					%>
					<img style="float: left; width: 13px; margin-top: 3px; padding: 1px;" src="commu/new_img/newimg.png">
					<%
					}
					%>
				</td>

				<%
				String nickname = udao.getName_num(dto.getUser_num());
				%>
				<td class="myinfo"><%=nickname%></td>

				<td class="myinfo"><%=sdf.format(dto.getCommu_writeday())%></td>

				<td class="myinfo"><%=dto.getCommu_readcount()%></td>
			</tr>

			<%
			}
			}
			%>
		</table>
		<%
		if (loginok != null) {
			if (myid.equals("admin")) {
		%>
		<div style="float: right;">
			<button style="float: left; border:1px solid red; color:red;" type="button" id="admindelete" class="btn btn-default btn-sm" onclick="location.href='#'">삭제</button>
			<%
			}
			%>


			<button type="button" class="btn btn-default btn-sm" style="float: right; margin-left: 5px;" onclick="location.href='index.jsp?main=commu/commu_addform.jsp?category=with'">
				<span class="glyphicon glyphicon-pencil"></span>글쓰기
			</button>
		</div>
		<%
		}
		%>


	</div>


	<!-- 페이징처리 -->
	<div style="width: 500px; text-align: center;" class="container">
		<ul class="pagination">
			<%
			//이전
			if (startPage > 1) {
			%>
			<li>
				<a href="index.jsp?main=commu/commu_withlist.jsp?category=with&currentPage=<%=startPage - 1%>">이전</a>
			</li>
			<%
			}

			for (int pp = startPage; pp <= endPage; pp++) {

			if (pp == currentPage) {
			%>
			<li class="active">
				<a href="index.jsp?main=commu/commu_withlist.jsp?category=with&currentPage=<%=pp%>"><%=pp%></a>
			</li>
			<%
			} else {
			%>
			<li>
				<a href="index.jsp?main=commu/commu_withlist.jsp?category=with&currentPage=<%=pp%>"><%=pp%></a>
			</li>
			<%
			}

			}

			//다음
			if (endPage < totalPage) {
			%>
			<li>
				<a href="index.jsp?main=commu/commu_withlist.jsp?category=with&currentPage=<%=endPage + 1%>">다음</a>
			</li>
			<%
			}
			%>
		</ul>
	</div>

</body>
</html>