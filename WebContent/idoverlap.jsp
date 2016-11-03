<%@page import="com.dev.doodle.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
    String id = request.getParameter("id");
    
	UsersDAO dao = UsersDAO.getDAO();
  
    //데이터베이스 연동을 통한 아이디 중복검사 결과를 얻어오는 과정에 대한 가정
    boolean result=dao.selectOverlap(id);

   
%>
{"result":<%=result %>}


