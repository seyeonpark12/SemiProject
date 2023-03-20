<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
//관리자 체크박스 삭제action!!!!
String nums = request.getParameter("nums");

//nums에서 구분기호 ,로 읽어서 분리한걸 num
String[] num = nums.split(",");

UserDao dao = new UserDao();

for (String user_n : num) {

	dao.deleteUser(user_n);

}

//목록으로 이동
response.sendRedirect("../index.jsp?main=mypage/admin_peoplelist.jsp");
%>

