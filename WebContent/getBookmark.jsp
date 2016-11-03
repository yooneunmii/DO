<%@page import="com.dev.doodle.vo.User"%>
<%@page import="com.dev.doodle.dao.BookmarkDAO"%>
<%@page import="com.dev.doodle.vo.Bookmark"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

User login = (User) session.getAttribute("loginUser");
int userNo = login.getNo();


List<Bookmark> markerList = BookmarkDAO.getDAO().selectBookmark(userNo);
//for (Bookmark bookmark : markerList){
	//System.out.println(bookmark.getTitle());
	//System.out.println(bookmark.getRegdate());
	//System.out.println(bookmark.getContent());
//}

ObjectMapper om = new ObjectMapper();

String json = om.writeValueAsString(markerList);
out.print(json);
%>