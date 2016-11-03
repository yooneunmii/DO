<%@page import="com.dev.doodle.dao.UsersDAO"%>
<%@page import="com.dev.doodle.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
 request.setCharacterEncoding("UTF-8");

 String id = request.getParameter("id");
 String password = request.getParameter("pwd");
 
 User user = new User(id,password,0);
 
 User loginUser = UsersDAO.getDAO().selectLogin(user);
 
 session.setAttribute("loginUser", loginUser);

 String referer = request.getHeader("referer");

 response.sendRedirect(referer);
 
%>
