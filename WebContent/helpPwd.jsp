<%@page import="com.dev.doodle.dao.UsersDAO"%>
<%@page import="com.dev.doodle.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");

   String nickname = request.getParameter("nickname");
   String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
   String id = request.getParameter("id");
   
   //비번 찾기
   User searchPwd = new User(id,nickname,phone);
   
   String userPwd = UsersDAO.getDAO().searchPwd(searchPwd);
   session.setAttribute("userPwd", userPwd);
   
   response.sendRedirect("help.jsp");

%>

