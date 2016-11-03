<%@page import="com.dev.doodle.dao.UsersDAO"%>
<%@page import="com.dev.doodle.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");

   String nickname = request.getParameter("nickname");
   String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
   
   //아이디 찾기
   User searchId = new User(nickname,phone,1);
   
   String userId = UsersDAO.getDAO().searchId(searchId);
   session.setAttribute("userId", userId);
   
   response.sendRedirect("help.jsp");
%>

