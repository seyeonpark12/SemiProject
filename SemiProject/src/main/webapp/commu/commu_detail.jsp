<%@page import="data.dto.MentDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MentDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.CommuDto"%>
<%@page import="data.dao.CommuDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WPICK</title>
<link rel="favicon" href="../layout_image/titlelogo.ico">
<link rel="shortcut icon" type="../layoutimage/x-icon" href="../layout_image/titlelogo.ico">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>


<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
	list-style: none;
	font-family: "Noto Sans KR";
	color: black;
}

input:focus {
	outline: none;
}

.content:focus {
	outline: none;
}

.ca_subject {
	font-size: 18px;
	font-weight: 300;
	letter-spacing: -1.2px;
	line-height: 36px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	z-index: 1; /*다른 요소들보다 앞에 배치*/
}

.dropdown-content a {
	display: block;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>

<script type="text/javascript">
   
   $(function(){
      
      var ment_num=$("ment_num").val();
      
      //댓글삭제
      $(document).on("click",".mentdelete",function(){
         
         ment_num=$(this).attr("ment_num");
         //alert(ment_num);
         
         $.ajax({
            
            type:"get",
            dataType:"html",
            url:"ment/ment_delete.jsp",
            data:{"ment_num":ment_num},
            success:function(res){
                                       
               location.reload();
            }
         });
      });
      
      //수정폼 모달 띄우기
      $(document).on("click",".mentupdate",function(){
         
         ment_num=$(this).attr("ment_num");
         //alert(ment_num);
         
         $.ajax({
            
            type:"get",
            dataType:"json",
            url:"ment/ment_update.jsp",
            data:{"ment_num":ment_num},
            success:function(res){
               //alert(res);
               $("#update_ment_content").val(res.ment_content);
            }
         });
         
         $("#myModal3").modal();
         
      });
      
      //댓글수정
      $(document).on("click","#btnupdate",function(){
         
         var ment_content=$("#update_ment_content").val();
         //alert(ment_content);
         
         $.ajax({
            
            type:"get",
            url:"ment/ment_updateaction.jsp",
            dataType:"html",
            data:{"ment_num":ment_num,"ment_content":ment_content},
            success:function(){
               
               location.reload();
            }
         })
      });
      
   });

</script>

</head>

<body>
	<%
	//로그인 세션
	String myid = (String) session.getAttribute("myid");
	String loginok = (String) session.getAttribute("loginok");

	//commu_num(게시글번호) 받아오기
	String commu_num = request.getParameter("commu_num");

	CommuDao dao = new CommuDao();

	//조회수 dao
	dao.updateReadCount(commu_num);

	//commu_num에 따른 각각의 dto값
	CommuDto dto = dao.getCommuData(commu_num);

	//날짜형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

	//글 쓴 사람의 번호(user_num 받아오기)
	String user_num = request.getParameter("user_num");

	//usert dao선언
	UserDao udao = new UserDao();

	//글 쓴 사람 id
	String writer_id = udao.getId(dto.getUser_num());

	String currentPage = request.getParameter("currentPage");

	//댓글 목록 가져오기
	MentDao mdao = new MentDao();
	//commu_num에 따른 댓글리스트
	List<MentDto> mlist = mdao.getAllMent(dto.getCommu_num());

	String category = request.getParameter("category");
	String href = "";

	if (category != null) {

		href = "index.jsp?main=commu/" + (category.equals("total")
		? "commu_totallist.jsp"
		: category.equals("free")
				? "commu_freelist.jsp"
				: category.equals("share")
						? "commu_sharelist.jsp"
						: category.equals("with") ? "commu_withlist.jsp" : "");
	} else
		href = "index.jsp?main=commu/commu_totallist.jsp";
	%>

	<div>

		<input type="hidden" name="commu_num" value="<%=commu_num%>">
		<input type="hidden" name="user_num" value="<%=user_num%>">

		<table style="width: 100%; margin-left: 0px;">
			<tr>
				<td width="1000" style="float: inherit; text-align: center; height: 300px; padding: 30px;">
					<b class="ca_subject" style="color: gray; font-size: 16px; font-weight: 400;">[<%=dto.getCommu_category()%>]
					</b><br> <b class="ca_subject" style="font-size: 26px; font-weight: 500;"><%=dto.getCommu_subject()%></b>
				</td>
			</tr>

			<tr>
				<td width="1000" style="height: 100px; padding: 30px 300px;">
					<%
					String nickname = udao.getName_num(dto.getUser_num());
					%>
					<!-- <b class="ca_subject">작성자</b>  -->
					<b class="ca_subject" style="font-size: 14px;"><%=nickname%></b> <b class="ca_subject" style="color: gray; font-size: 14px;">&nbsp;• &nbsp;<%=sdf.format(dto.getCommu_writeday())%></b> <b class="ca_subject" style="float: right; font-size: 14px; color: gray;">조회수&nbsp;&nbsp;<span style="font-size: 14px; line-height: 14px; height: 14px; color: gray;"><%=dto.getCommu_readcount()%></span></b>
				</td>
			</tr>
		</table>
		<div style="float: right; margin-top: -20px;">
			<!-- 목록가기 버튼.. -->

			<button style="margin-right: 300px; border: 1px solid #CBB6D9; color: #fff; background-color: #CBB6D9; float: right;" type="button" class="btn btn-default btn-sm" onclick="location.href='<%=href%>'">목록</button>


			<%
			if (loginok != null) {

				if (myid.equals(writer_id)) {
			%>

			<button type="button" class="btn btn-default btn-sm" style="float: right; margin-right: 3px; border: 1px solid #CBB6D9; color: #CBB6D9;" onclick="funcdel(<%=commu_num%>,<%=currentPage%>)">삭제</button>

			<button type="button" class="btn btn-default btn-sm" style="float: right; margin-right: 3px; border: 1px solid #CBB6D9; color: #CBB6D9;" onclick="location.href='index.jsp?main=commu/commu_updateform.jsp?commu_num=<%=dto.getCommu_num()%>&currentPage=<%=currentPage%>'">수정</button>

		</div>

		<%
		} else if (myid.equals("admin")) {
		%>

		<div style="float: right;">
			<button type="button" class="btn btn-default btn-sm" style="float: right; margin-right: 3px; border: 1px solid #CBB6D9; color: #CBB6D9;" onclick="funcdel(<%=commu_num%>,<%=currentPage%>)">삭제</button>
		</div>
		<%
		}
		}
		%>

		<!-- 삭제 사용자함수 -->
		<script type="text/javascript">
   
      function funcdel(commu_num,currentPage){
         
         var a=confirm("삭제하시겠습니까?");
   
         if(a==1){
            location.href="commu/commu_delete.jsp?commu_num="+commu_num+"&currentPage="+currentPage;
         }
      }
   </script>
		<br>
		<hr>

		<div style="width: 1000px; margin: 0 280px; margin-bottom: 30px; padding: 30px; font-size: 18px;" id="movie_content">

			<img alt="" src="commu_save/<%=dto.getCommu_photo()%>" style="max-width: 100%; max-height: 100%;">
			<%
			//사진 첨부 된 글이면 한 줄 띄워주고 글자출력..통할런지는 몰겠음
			if (dto.getCommu_photo() != null) {
			%>
			<br>
			<%
			}
			%>
			<%=dto.getCommu_content().replace("\n", "<br>")%>
		</div>
		<hr>



		<%
		int mentcount = mdao.getAllMent(commu_num).size();
		dto.setAnswerCount(mentcount);
		%>


		<div style="width: 1000px; background-color: #fbfcfd; margin: 0 280px; margin-top: 100px; margin-bottom: 30px; padding: 30px;" id="movie_comtent">

			<h3 style="color: gray; font-size: 16px; font-weight: 400;">
				댓글
				<%=dto.getAnswerCount()%></h3>
			<!-- 댓글인서트 -->
			<%
			if (loginok != null) {
			%>

			<div>
				<form action="ment/ment_addaction.jsp" method="post">
					<input type="hidden" name="commu_num" value="<%=commu_num%>">
					<input type="hidden" name="user_num" value="<%=user_num%>">
					<input type="hidden" name="currentPage" value="<%=currentPage%>">

					<table style="width: 800px; height: 120px; background-color: #fff;">
						<tr>
							<td style="width: 90%;">
								<textarea name="ment_content" required="required" style="display: block; width: 100%; padding: 20px; overflow: hidden; overflow-wrap: break-word; height: 80px; min-height: 17px; padding-right: 1px; border: 0; font-size: 13px; -webkit-appearance: none; resize: none; box-sizing: border-box; background: transparent; color: var(- -skinTextColor); outline: 0;"></textarea>
							</td>

							<td>
								<button type="submit" style="background-color: #CBB6D9; color: #fff; font-size: 16px; font-weight: 600; border: 0; outline: 0; text-align: center; width: 100%; height: 100%;">등록</button>
							</td>

						</tr>
					</table>
				</form>

			</div>

			<%
			} else if (loginok == null) {
			%>
			<div style="text-align: center;">
				<b style="color: gray; text-align: center; font-size: 1.2em;">댓글 작성은 로그인 후 이용 가능합니다</b>
			</div>

			<%
			}
			%>

			<!-- 댓글조회 -->
			<div>
				<%
				if (dto.getAnswerCount() == 0) {
				%>
				<div style="text-align: center; margin-top: 20px;">
					<b style="color: gray; text-align: center; font-size: 1.2em;">등록 된 댓글이 없습니다<br>첫 댓글을 작성해 보세요!
					</b>
				</div>

				<%
				} else {
				%>
				<table style="width: 100%; margin-left: 15px; margin-top: 20px;">
					<%
					for (MentDto mdto : mlist) {
					%>
					<tr>
						<td style="width: 90%; height: 100%; padding: 50px; border-bottom: 1px solid lightgray;">
							<%
							String mentnickname = udao.getName_num(mdto.getUser_num());
							String ment_id = udao.getId(mdto.getUser_num());
							%>
							<b style="float: left;"><%=mentnickname%></b>
							<%
							//게시글 작성자가 자기글에 댓글 달았을때 [글쓴이] 표시
							if (writer_id.equals(ment_id)) {
							%>
							<span style="float: left; color: gray; font-weight: bold; height: 12px; margin-left: 3px;">[글쓴이]</span>
							<%
							}
							%>
							<span style="float: left; font-size: 9pt; height: 12px; color: gray;"><%=sdf.format(mdto.getMent_writeday())%> 
							<%
							 //오늘 올라온 댓글이면 N icon
							 String inpuDate = sdf.format(mdto.getMent_writeday());
							 String now = sdf.format(new java.util.Date());

							 if (inpuDate.equals(now)) {
							 %> <img style="float: right; width: 12px; height: 12px; margin-top: 3px; margin-left: 3px;" src="commu/new_img/newimg.png"> <br> <br> <%
							 }
							 %> </span><br> <br> <span style="font-size: 10pt;"><%=mdto.getMent_content().replace("\n", "<br>")%></span>
						</td>

						<td>
							<div class="dropdown" style="margin-left: 30px;">

								<%
								//댓글 수정,삭제
								if (loginok != null) {
									if (myid.equals(ment_id)) {
								%>
								<span class="dropbtn fa-solid fa-ellipsis-vertical" style="font-size: 20px;"></span>
								<div class="dropdown-content">
									<button type="button" class="mentupdate" data-toggle="modal" data-target="#myModal3" style="color: #fff; border: none; background: #CBB6D9; width: 60px; height: 30px; line-height: 30px;" ment_num=<%=mdto.getMent_num()%>>수정</button>
									<button type="button" class="mentdelete" style="color: #fff; border: none; background: #CBB6D9; width: 60px; height: 30px; line-height: 30px;" ment_num=<%=mdto.getMent_num()%>>삭제</button>
								</div>
								<%
								} else if (myid.equals("admin")) {
								%>
								<span class="dropbtn fa-solid fa-ellipsis-vertical" style="font-size: 20px;"></span>
								<div class="dropdown-content">
									<button type="button" class="mentdelete" style="color: #fff; border: none; background: #CBB6D9; width: 60px; height: 30px; line-height: 30px;" ment_num=<%=mdto.getMent_num()%>>삭제</button>
								</div>
								<%
								}
								}
								%>

							</div>
						</td>

					</tr>

					<%
					}
					}
					%>
				</table>
			</div>

		</div>

	</div>


	<!-- 댓글 수정 모달!!! -->
	<div class="modal fade" id="myModal3" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="margin-top: 160px; width: 400px;">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">댓글 수정</h4>
				</div>

				<div class="modal-body" style="padding: 20px;">
					<textarea type="text" id=update_ment_content style="width: 355px; height: 200px; padding: 10px; border: none; outline: none; resize: none;"></textarea>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-sm" style="border: 1px solid #CBB6D9;" data-dismiss="modal" id="btnupdate">수정</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>