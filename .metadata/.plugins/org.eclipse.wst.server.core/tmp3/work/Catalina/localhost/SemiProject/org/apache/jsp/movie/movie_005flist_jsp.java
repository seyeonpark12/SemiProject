/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-03-24 01:06:47 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.movie;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import data.dao.PickDao;
import java.util.List;
import data.dao.MovieDao;
import data.dto.MovieDto;

public final class movie_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("data.dao.MovieDao");
    _jspx_imports_classes.add("data.dto.MovieDto");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("data.dao.PickDao");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<title>WPICK</title>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("<link\r\n");
      out.write("	href=\"https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@400;700&display=swap\"\r\n");
      out.write("	rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("	href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\r\n");
      out.write("\r\n");
      out.write("<link href=\"css/mvlist.css\" type=\"text/css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"css/main.css\" type=\"text/css\" rel=\"stylesheet\">\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("	href=\"https://use.fontawesome.com/releases/v5.2.0/css/all.css\" />\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.3.js\"></script>\r\n");
      out.write("<script\r\n");
      out.write("	src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js\"></script>\r\n");
      out.write("<script\r\n");
      out.write("	src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("	$(function() {\r\n");
      out.write("\r\n");
      out.write("		$(\"#moviedel\").click(function() {\r\n");
      out.write("\r\n");
      out.write("			var cnt = $(\".movie_num:checked\").length;\r\n");
      out.write("			if (cnt == 0) {\r\n");
      out.write("\r\n");
      out.write("				alert(\"삭제할 영화를 선택해주세요\");\r\n");
      out.write("				return;\r\n");
      out.write("			}\r\n");
      out.write("\r\n");
      out.write("			$(\".movie_num:checked\").each(function(i, element) {\r\n");
      out.write("\r\n");
      out.write("				var movie_num = $(this).attr(\"movie_num\");\r\n");
      out.write("				$.ajax({\r\n");
      out.write("					type : \"get\",\r\n");
      out.write("					dataType : \"html\",\r\n");
      out.write("					url : \"movie/movie_delete.jsp\",\r\n");
      out.write("					data : {\r\n");
      out.write("						\"movie_num\" : movie_num\r\n");
      out.write("					},\r\n");
      out.write("					success : function() {\r\n");
      out.write("\r\n");
      out.write("						location.reload();\r\n");
      out.write("					}\r\n");
      out.write("				});\r\n");
      out.write("			});\r\n");
      out.write("\r\n");
      out.write("		});\r\n");
      out.write("\r\n");
      out.write("		$('.nav>li>a').on(\r\n");
      out.write("				'click',\r\n");
      out.write("				function() {\r\n");
      out.write("					// 다른 li 요소의 배경색을 해제하고 on 클래스를 제거합니다.\r\n");
      out.write("					$('.nav>li>a').not(this).removeClass('on').css(\r\n");
      out.write("							'background-color', '').css('color', '');\r\n");
      out.write("					// 클릭된 요소의 배경색을 purple로 변경하고 on 클래스를 추가합니다.\r\n");
      out.write("					$(this).addClass('on').css('background-color', '#c08bbc')\r\n");
      out.write("							.css('color', '#fff');\r\n");
      out.write("				});\r\n");
      out.write("\r\n");
      out.write("	});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("a:hover {\r\n");
      out.write("	text-decoration: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".nav>li>a:focus, .nav>li>a:hover {\r\n");
      out.write("	text-decoration: none;\r\n");
      out.write("	color: #fff;\r\n");
      out.write("	background-color: #CBB6D9;\r\n");
      out.write("	border: 0px solid;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("ul>li>a {\r\n");
      out.write("	color: #c08bbc;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".on {\r\n");
      out.write("	text-decoration: none;\r\n");
      out.write("	background-color: #c08bbc;\r\n");
      out.write("	color: #fff;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,\r\n");
      out.write("	.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover\r\n");
      out.write("	{\r\n");
      out.write("	z-index: 3;\r\n");
      out.write("	color: #fff;\r\n");
      out.write("	cursor: default;\r\n");
      out.write("	background-color: #CBB6D9;\r\n");
      out.write("	border-color: #CBB6D9;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".pagination>li>a, .pagination>li>a, .pagination>li>span, .pagination>li>span\r\n");
      out.write("	{\r\n");
      out.write("	z-index: 2;\r\n");
      out.write("	color: #CBB6D9;\r\n");
      out.write("	background-color: #fff;\r\n");
      out.write("	border: 0px solid;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus,\r\n");
      out.write("	.pagination>li>span:hover {\r\n");
      out.write("	z-index: 2;\r\n");
      out.write("	color: #fff;\r\n");
      out.write("	background-color: #ECE6FF;\r\n");
      out.write("	border: 0px solid;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".ordernum {\r\n");
      out.write("	font-weight: 700;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");

//로그인상태 확인 후 입력폼  나타내기
String loginok = (String) session.getAttribute("loginok");
//id
String myid = (String) session.getAttribute("myid");

String movie_genre = request.getParameter("movie_genre");
String sort = request.getParameter("sort");
MovieDao dao = new MovieDao();

//블럭 < 1 2 3 4 5 >
int totalCount;
int totalCountGen; //장르별 토탈수
int totalPage;//총페이지수
int totalPageGen; //장르별 페이지수
int startPage;//각블럭의 시작페이지
int endPage;//각블럭의 끝페이지
int endPageGen;//장르별 끝페이지
int start;//각페이지의 시작번호
int perPage = 8;//한페이지에 보여질 글의 갯수
int perBlock = 5; //한블럭당 보여지는 페이지
int currentPage;//현재페이지
//int no;

//총개수
totalCount = dao.getTotalCount();
//카테고리별 총개수
totalCountGen = dao.getTotalCount_Genre(movie_genre);

//현재페이지 번호 읽기(단 null일때는 1페이지로둠)
if (request.getParameter("currentPage") == null)
	currentPage = 1;
else
	currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지 개수
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
//카테고리별 페이지 개수
totalPageGen = totalCountGen / perPage + (totalCountGen % perPage == 0 ? 0 : 1);

//각블럭의 시작페이지.. 현재페이지가 3(s:1, e:5)  6(s:6, e:10)
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;
endPageGen = startPage + perBlock - 1;

//총페이지가8 (6~10 ... endpage를 8로 수정해주어야함.)
if (endPage > totalPage)
	endPage = totalPage;
if (endPageGen > totalPageGen)
	endPageGen = totalPageGen;

//각페이지에서 불러올 시작번호
start = (currentPage - 1) * perPage;

//각페이지에서 필요한 게시글 가져오기
List<MovieDto> list_recent = dao.getList_Recent(start, perPage);
List<MovieDto> list_pick = dao.getList_Pcount(start, perPage);
List<MovieDto> list_rank = dao.getList_Rank_Avg(start, perPage);
List<MovieDto> list_genre_recent = dao.getList_Genre_Recent(movie_genre, start, perPage);
List<MovieDto> list_genre_pick = dao.getList_Genre_Pcount(movie_genre, start, perPage);
List<MovieDto> list_genre_rank = dao.getList_Genre_Rank_Avg(movie_genre, start, perPage);

      out.write("\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("	<div style=\"width: 100%; margin-top: 100px;\">\r\n");
      out.write("		<div class=\"container\">\r\n");
      out.write("			<ul class=\"nav nav-tabs\" style=\"margin-bottom: 10px;\">\r\n");
      out.write("				<li style=\"margin-left: 330px;\"><a\r\n");
      out.write("					class=\"all_genre ");
      out.print(movie_genre.equals("all") ? "on" : "");
      out.write("\"\r\n");
      out.write("					href=\"movie/select_genre_sort.jsp?movie_genre=all&sort=");
      out.print(sort);
      out.write("\">전체</a></li>\r\n");
      out.write("				<li><a\r\n");
      out.write("					class=\"romance ");
      out.print(movie_genre.equals("romance") ? "on" : "");
      out.write("\"\r\n");
      out.write("					href=\"movie/select_genre_sort.jsp?movie_genre=romance&sort=");
      out.print(sort);
      out.write("\">로맨스</a></li>\r\n");
      out.write("				<li><a\r\n");
      out.write("					class=\"action ");
      out.print(movie_genre.equals("action") ? "on" : "");
      out.write("\"\r\n");
      out.write("					href=\"movie/select_genre_sort.jsp?movie_genre=action&sort=");
      out.print(sort);
      out.write("\">액션</a></li>\r\n");
      out.write("				<li><a\r\n");
      out.write("					class=\"comedy ");
      out.print(movie_genre.equals("comedy") ? "on" : "");
      out.write("\"\r\n");
      out.write("					href=\"movie/select_genre_sort.jsp?movie_genre=comedy&sort=");
      out.print(sort);
      out.write("\">코미디</a></li>\r\n");
      out.write("				<li><a\r\n");
      out.write("					class=\"horror ");
      out.print(movie_genre.equals("horror") ? "on" : "");
      out.write("\"\r\n");
      out.write("					href=\"movie/select_genre_sort.jsp?movie_genre=horror&sort=");
      out.print(sort);
      out.write("\">공포</a></li>\r\n");
      out.write("				<li><a\r\n");
      out.write("					class=\"animation ");
      out.print(movie_genre.equals("animation") ? "on" : "");
      out.write("\"\r\n");
      out.write("					href=\"movie/select_genre_sort.jsp?movie_genre=animation&sort=");
      out.print(sort);
      out.write("\">애니메이션</a></li>\r\n");
      out.write("				<li><a\r\n");
      out.write("					class=\"everything ");
      out.print(movie_genre.equals("etc") ? "on" : "");
      out.write("\"\r\n");
      out.write("					href=\"movie/select_genre_sort.jsp?movie_genre=etc&sort=");
      out.print(sort);
      out.write("\">기타</a></li>\r\n");
      out.write("			</ul>\r\n");
      out.write("\r\n");
      out.write("			<div style=\"float: right;\">\r\n");
      out.write("				<div style=\"float: left;\">\r\n");
      out.write("					<a\r\n");
      out.write("						href=\"movie/select_genre_sort.jsp?movie_genre=");
      out.print(movie_genre);
      out.write("&sort=recent\" class=\"");
      out.print(sort.equals("recent")?"ordernum":"" );
      out.write("\"\r\n");
      out.write("						style=\"font-size: 12px; color: #653491; padding-top: 10px; padding-right: 10px;\">최신순\r\n");
      out.write("						&nbsp;|</a>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div style=\"float: left;\">\r\n");
      out.write("					<a\r\n");
      out.write("						href=\"movie/select_genre_sort.jsp?movie_genre=");
      out.print(movie_genre);
      out.write("&sort=rank\" class=\"");
      out.print(sort.equals("rank")?"ordernum":"" );
      out.write("\"\r\n");
      out.write("						style=\"font-size: 12px; color: #653491; padding-top: 10px; padding-right: 10px;\">평점순\r\n");
      out.write("						&nbsp;|</a>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div style=\"float: left;\">\r\n");
      out.write("					<a\r\n");
      out.write("						href=\"movie/select_genre_sort.jsp?movie_genre=");
      out.print(movie_genre);
      out.write("&sort=pick\" class=\"");
      out.print(sort.equals("pick")?"ordernum":"" );
      out.write("\"\r\n");
      out.write("						style=\"font-size: 12px; color: #653491; padding-top: 10px; padding-right: 10px;\">pick순</a>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		");

		if (movie_genre.equals("all")) {
		
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		<div class=\"tab-content\"\r\n");
      out.write("			style=\"padding-top: 40px; margin-left: 170px;\">\r\n");
      out.write("			<div id=\"all\">\r\n");
      out.write("				<div>\r\n");
      out.write("					<div\r\n");
      out.write("						style=\"display: inline-flex; flex-wrap: wrap; justify-content: center; padding: 0 80px;\">\r\n");
      out.write("						");

						int i = 0;
						for (MovieDto dto : sort.equals("recent") ? list_recent : sort.equals("pick") ? list_pick : list_rank) {
							//이미지
							String poster = dto.getMovie_poster();
						
      out.write("\r\n");
      out.write("						");


						
      out.write("\r\n");
      out.write("						<div style=\"padding: 10px;\">\r\n");
      out.write("							");

							if (loginok != null) {
								if (myid.equals("admin")) {
							
      out.write("\r\n");
      out.write("\r\n");
      out.write("							<input type=\"checkbox\" name=\"movie_num\" class=\"movie_num\"\r\n");
      out.write("								movie_num=\"");
      out.print(dto.getMovie_num());
      out.write("\" id=\"movie_del\">\r\n");
      out.write("\r\n");
      out.write("							");

							}
							}
							
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("							");

							double rank = Math.round(dto.getMovie_rank_avg() * 10.0) / 10.0;
							PickDao pdao = new PickDao();
							int pcount = pdao.getTotalCount_Pcount(dto.getMovie_num());
							String date = dto.getMovie_year();
							
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("							<a movie_num=\"");
      out.print(dto.getMovie_num());
      out.write("\"\r\n");
      out.write("								style=\"cursor: pointer; display: flex; flex-direction: column; align-items: left; text-decoration: none;\"\r\n");
      out.write("								class=\"godetail\"> <img src=\"movie_save/");
      out.print(poster);
      out.write("\"\r\n");
      out.write("								class=\"poster\"\r\n");
      out.write("								onclick=\"location.href='index.jsp?main=review/review_moviedetail.jsp?movie_genre=all&sort=");
      out.print(sort);
      out.write("&movie_num=");
      out.print(dto.getMovie_num());
      out.write("&currentPage=");
      out.print(currentPage);
      out.write("'\">\r\n");
      out.write("								<span\r\n");
      out.write("								style=\"text-align: center; font-size: 16px; font-weight: 600; padding-top: 10px; width: 100%;\">");
      out.print(dto.getMovie_subject());
      out.write("\r\n");
      out.write("									<br><font style=\"color:gray;\">");
      out.print(sort.equals("recent") ? date.substring(0, 4) : "");
      out.write("</font> \r\n");
      out.write("									");
      out.print(sort.equals("rank") ? "<b style='color:orange; font-size:15px; margin-right:2px;'>★</b>" + rank : "");
      out.write("\r\n");
      out.write("									");
      out.print(sort.equals("pick") ? "<b style='color:red; font-size:15px; margin-right:2px;'>♥</b>"+pcount : "");
      out.write(" </span>\r\n");
      out.write("\r\n");
      out.write("							</a>\r\n");
      out.write("						</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("						");

						if ((i + 1) % 4 == 0) {
						
      out.write("\r\n");
      out.write("					</div>\r\n");
      out.write("					<div\r\n");
      out.write("						style=\"display: inline-flex; flex-wrap: wrap; justify-content: center; padding: 0 80px;\">\r\n");
      out.write("						");

						}
						i++;
						}
						
      out.write("\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("			");

			if (loginok != null) {
				if (myid.equals("admin")) {
			
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			<div style=\"margin-left: 990px;\">\r\n");
      out.write("				<button type=\"button\" class=\"btn btn-default\"\r\n");
      out.write("					style=\"color: #653491; border: 1px solid #653491;\"\r\n");
      out.write("					onclick=\"location.href='index.jsp?main=movie/movie_addform.jsp'\">등록</button>\r\n");
      out.write("				<button type=\"button\" class=\"btn btn-default\" id=\"moviedel\">삭제</button>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("		");

		}
		}
		
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		<!-- 페이징 처리 -->\r\n");
      out.write("		<div style=\"width: 500px; text-align: center; margin-right: 38%;\"\r\n");
      out.write("			class=\"container\">\r\n");
      out.write("			<ul class=\"pagination\">\r\n");
      out.write("				");

				//이전
				if (startPage > 1) {
				
      out.write("\r\n");
      out.write("				<li><a\r\n");
      out.write("					href=\"index.jsp?main=movie/movie_list.jsp?movie_genre=all&sort=");
      out.print(sort);
      out.write("&currentPage=");
      out.print(startPage - 1);
      out.write("\">이전</a>\r\n");
      out.write("				</li>\r\n");
      out.write("				");

				}
				for (int pp = startPage; pp <= endPage; pp++) {
				if (pp == currentPage) {
				
      out.write("\r\n");
      out.write("				<li class=\"active\"><a\r\n");
      out.write("					href=\"index.jsp?main=movie/movie_list.jsp?movie_genre=all&sort=");
      out.print(sort);
      out.write("&currentPage=");
      out.print(pp);
      out.write('"');
      out.write('>');
      out.print(pp);
      out.write("</a>\r\n");
      out.write("				</li>\r\n");
      out.write("				");

				} else {
				
      out.write("\r\n");
      out.write("\r\n");
      out.write("				<li><a\r\n");
      out.write("					href=\"index.jsp?main=movie/movie_list.jsp?movie_genre=all&sort=");
      out.print(sort);
      out.write("&currentPage=");
      out.print(pp);
      out.write('"');
      out.write('>');
      out.print(pp);
      out.write("</a>\r\n");
      out.write("				</li>\r\n");
      out.write("				");

				}
				}

				//다음
				if (endPage < totalPage) {
				
      out.write("\r\n");
      out.write("				<li><a\r\n");
      out.write("					href=\"index.jsp?main=movie/movie_list.jsp?movie_genre=all&sort=");
      out.print(sort);
      out.write("&currentPage=");
      out.print(endPage + 1);
      out.write("\">다음</a>\r\n");
      out.write("				</li>\r\n");
      out.write("				");

				}
				
      out.write("\r\n");
      out.write("			</ul>\r\n");
      out.write("		</div>\r\n");
      out.write("\r\n");
      out.write("		");

		} else {
		
      out.write("\r\n");
      out.write("		<div class=\"tab-content\"\r\n");
      out.write("			style=\"padding-top: 40px; margin-left: 170px;\">\r\n");
      out.write("			<div id=\"movie_genre\">\r\n");
      out.write("				<div>\r\n");
      out.write("					<div\r\n");
      out.write("						style=\"display: inline-flex; flex-wrap: wrap; justify-content: center; padding: 0 80px;\">\r\n");
      out.write("						");

						int i = 0;
						for (MovieDto dto : sort.equals("recent") ? list_genre_recent
								: sort.equals("pick") ? list_genre_pick : list_genre_rank) {

							String poster = dto.getMovie_poster();
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("						<div style=\"padding: 10px;\">\r\n");
      out.write("							");

							if (loginok != null) {
								if (myid.equals("admin")) {
							
      out.write("\r\n");
      out.write("							<input type=\"checkbox\" name=\"movie_num\" class=\"movie_num\"\r\n");
      out.write("								movie_num=\"");
      out.print(dto.getMovie_num());
      out.write("\" id=\"movie_del\">\r\n");
      out.write("							");

							}
							}
							
      out.write("\r\n");
      out.write("\r\n");
      out.write("							");

							double rank = Math.round(dto.getMovie_rank_avg() * 10.0) / 10.0;
							PickDao pdao = new PickDao();
							int pcount = pdao.getTotalCount_Pcount(dto.getMovie_num());
							String date = dto.getMovie_year();
							
      out.write("\r\n");
      out.write("							<a movie_num=\"");
      out.print(dto.getMovie_num());
      out.write("\"\r\n");
      out.write("								style=\"cursor: pointer; display: flex; flex-direction: column; align-items: left;\"\r\n");
      out.write("								class=\"godetail\"> <img src=\"movie_save/");
      out.print(poster);
      out.write("\"\r\n");
      out.write("								class=\"poster\"\r\n");
      out.write("								onclick=\"location.href='index.jsp?main=review/review_moviedetail.jsp?movie_genre=");
      out.print(movie_genre);
      out.write("&sort=");
      out.print(sort);
      out.write("&movie_num=");
      out.print(dto.getMovie_num());
      out.write("&currentPage=");
      out.print(currentPage);
      out.write("'\">\r\n");
      out.write("								<span\r\n");
      out.write("								style=\"text-align: center; font-size: 14px; font-weight: 600; padding-top: 10px; width: 100%;\">");
      out.print(dto.getMovie_subject());
      out.write("\r\n");
      out.write("									<br> ");
      out.print(sort.equals("recent") ? date.substring(0, 4) : "");
      out.write("\r\n");
      out.write("									");
      out.print(sort.equals("rank") ? "<b style='color:orange; font-size:23px;'>★</b>" + rank : "");
      out.write("\r\n");
      out.write("									");
      out.print(sort.equals("pick") ? pcount : "");
      out.write("</span>\r\n");
      out.write("							</a>\r\n");
      out.write("						</div>\r\n");
      out.write("\r\n");
      out.write("						");

						if ((i + 1) % 4 == 0) {
						
      out.write("\r\n");
      out.write("					</div>\r\n");
      out.write("\r\n");
      out.write("					<div\r\n");
      out.write("						style=\"display: inline-flex; flex-wrap: wrap; justify-content: center; padding: 0 80px;\">\r\n");
      out.write("						");

						}
						i++;
						}
						
      out.write("\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("			");

			if (loginok != null) {
				if (myid.equals("admin")) {
			
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			<div style=\"margin-left: 990px;\">\r\n");
      out.write("				<button type=\"button\" class=\"btn btn-default\"\r\n");
      out.write("					style=\"color: #653491; border: 1px solid #653491;\"\r\n");
      out.write("					onclick=\"location.href='index.jsp?main=movie/movie_addform.jsp'\">등록</button>\r\n");
      out.write("				<button type=\"button\" class=\"btn btn-default\" id=\"moviedel\">삭제</button>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("		");

		}
		}
		
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		<!-- 페이징 처리 -->\r\n");
      out.write("		<div style=\"width: 500px; text-align: center; margin-right: 40%;\"\r\n");
      out.write("			class=\"container\">\r\n");
      out.write("			<ul class=\"pagination\">\r\n");
      out.write("				");

				//이전

				if (startPage > 1) {
				
      out.write("\r\n");
      out.write("				<li><a\r\n");
      out.write("					href=\"index.jsp?main=movie/movie_list.jsp?movie_genre=");
      out.print(movie_genre);
      out.write("&sort=");
      out.print(sort);
      out.write("&currentPage=");
      out.print(startPage - 1);
      out.write("\">이전</a>\r\n");
      out.write("				</li>\r\n");
      out.write("				");

				}
				for (int pp = startPage; pp <= endPageGen; pp++) {
				if (pp == currentPage) {
				
      out.write("\r\n");
      out.write("				<li class=\"active\"><a\r\n");
      out.write("					href=\"index.jsp?main=movie/movie_list.jsp?movie_genre=");
      out.print(movie_genre);
      out.write("&sort=");
      out.print(sort);
      out.write("&currentPage=");
      out.print(pp);
      out.write('"');
      out.write('>');
      out.print(pp);
      out.write("</a>\r\n");
      out.write("				</li>\r\n");
      out.write("				");

				} else {
				
      out.write("\r\n");
      out.write("\r\n");
      out.write("				<li><a\r\n");
      out.write("					href=\"index.jsp?main=movie/movie_list.jsp?movie_genre=");
      out.print(movie_genre);
      out.write("&sort=");
      out.print(sort);
      out.write("&currentPage=");
      out.print(pp);
      out.write('"');
      out.write('>');
      out.print(pp);
      out.write("</a>\r\n");
      out.write("				</li>\r\n");
      out.write("				");

				}
				}

				//다음
				if (endPageGen < totalPageGen) {
				
      out.write("\r\n");
      out.write("				<li><a\r\n");
      out.write("					href=\"index.jsp?main=movie/movie_list.jsp?movie_genre=");
      out.print(movie_genre);
      out.write("&sort=");
      out.print(sort);
      out.write("&currentPage=");
      out.print(endPageGen + 1);
      out.write("\">다음</a>\r\n");
      out.write("				</li>\r\n");
      out.write("				");

				}
				
      out.write("\r\n");
      out.write("			</ul>\r\n");
      out.write("		</div>\r\n");
      out.write("\r\n");
      out.write("		");

		}
		
      out.write("\r\n");
      out.write("	</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
