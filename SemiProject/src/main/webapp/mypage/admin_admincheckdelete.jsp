<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>

<%
//관리자 체크박스 삭제action!!!!
String user_n = request.getParameter("user_n");

//nums에서 구분기호 ,로 읽어서 분리한걸 num
String[] num = user_n.split(",");

UserDao dao = new UserDao();

for (String user_num : num) {

   dao.deleteUser(user_num);

}


%>
