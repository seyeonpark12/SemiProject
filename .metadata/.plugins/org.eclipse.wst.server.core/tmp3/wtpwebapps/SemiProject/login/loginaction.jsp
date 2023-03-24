<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%
   String user_id=request.getParameter("user_id");
   String user_pw=request.getParameter("user_pw");
   String saveid=request.getParameter("saveid");  //체크안하면 null
   
   UserDao dao=new UserDao();
   boolean b=dao.isIdPwCheck(user_id, user_pw);
   
   //아이디와 비번이 맞으면 3개의 세션을 저장하고
   //로그인메인으로 이동
   if(b){
      
      //세션유지시간(생략시 30분)
      session.setMaxInactiveInterval(60*60*8);
      session.setAttribute("loginok", "yes");
      session.setAttribute("myid", user_id);
      session.setAttribute("saveid", saveid==null?null:"yes");
      session.setAttribute("saveok", user_id);
      
   }
   
   JSONObject ob=new JSONObject();
   ob.put("b", b);
   
 %>
 
 <%=ob.toString() %>