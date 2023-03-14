<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="data.dao.ReviewDao"/>
<jsp:useBean id="dto" class="data.dto.ReviewDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
dao.insertreview(dto);
%>