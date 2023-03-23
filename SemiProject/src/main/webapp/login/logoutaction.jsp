<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <%
     //loginok세션제거
     session.removeAttribute("loginok");
     session.removeAttribute("myid");
  
     //메인페이지이동
     response.sendRedirect("../index.jsp");
  %>
