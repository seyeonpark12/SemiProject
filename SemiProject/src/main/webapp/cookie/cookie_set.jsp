<%@page import="data.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String movie_num=request.getParameter("movie_num");

System.out.print("쿠키 실행: ");
Cookie[] cookies = request.getCookies(); //client에서 쿠키를 받아옴
Cookie cookie;

//MovieDao dao=new MovieDao();
//movie_num=dao.getData(movie_num).getMovie_poster();

if(cookies!=null){
    for(int i=0;i<cookies.length;i++){
       if(cookies[i].getName().equals("recent_mv")){
          
          String s= cookies[i].getValue();
          String[] arr= s.split("&");
          //System.out.println("받아온 쿠키개수: "+arr.length);
          
          if(arr.length>=3){
             String vlaue=arr[1]+"&"+arr[2]+"&"+movie_num;
             //String vlaue=item_num;
               cookie=new Cookie("recent_mv",vlaue);
               response.addCookie(cookie);
               cookie.setMaxAge(60*60*8); 
              System.out.println(cookies[i].getValue());
          }
          
          else if(cookies[i].getValue().equals("")){
             	String vlaue=movie_num;
               cookie=new Cookie("recent_mv",vlaue);
               response.addCookie(cookie);
               cookie.setMaxAge(60*60*8); 
              System.out.println(cookies[i].getValue());
          }else{
             String vlaue=cookies[i].getValue()+"&"+movie_num;
               cookie=new Cookie("recent_mv",vlaue);
               response.addCookie(cookie);
               cookie.setMaxAge(60*60*8); 
              System.out.println(cookies[i].getValue());
          }
        }
       
    }
}
%>