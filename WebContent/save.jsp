<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
String body = request.getParameter("body");


System.out.println(body);

session.setAttribute("body", body);

%>