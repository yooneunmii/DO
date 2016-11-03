<%@page import="javax.websocket.SendResult"%>
<%@page import="com.dev.doodle.dao.ParagraphDAO"%>
<%@page import="com.dev.doodle.vo.Paragraph"%>
<%@page import="com.dev.doodle.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		ParagraphDAO dao= ParagraphDAO.getDAO();
		
		 request.setCharacterEncoding("UTF-8");
		 
		String markup = (String) session.getAttribute("body");
		session.removeAttribute("body");
		
		response.sendRedirect("longAgo.jsp");
		
%>

<%=markup %>
