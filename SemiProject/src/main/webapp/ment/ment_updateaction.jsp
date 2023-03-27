<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<jsp:useBean id="dao" class="data.dao.MentDao"></jsp:useBean>
<jsp:useBean id="dto" class="data.dto.MentDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />

<%
dao.updateMent(dto);
%>