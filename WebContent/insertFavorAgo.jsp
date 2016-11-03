<%@page import="com.dev.doodle.dao.FavorDAO"%>
<%@page import="com.dev.doodle.vo.Favor"%>
<%@page import="com.dev.doodle.dao.OldContentDAO"%>
<%@page import="com.dev.doodle.vo.OldContent"%>
<%@page import="com.dev.doodle.vo.User"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post방식의 한글처리
	request.setCharacterEncoding("UTF-8");

	User loginUser = (User)session.getAttribute("loginUser");
	
	FavorDAO dao=FavorDAO.getDAO();

	String noStr =request.getParameter("oldNo");
	int oldNo= Integer.parseInt(noStr);
	
	String result= request.getParameter("result");
	
	int userNo= loginUser.getNo();
	
	
	Favor favor= new Favor(3,userNo,oldNo,result);
	int no=dao.selectoverlap(favor);
	favor.setNo(no);
	if(no==0){
	
	dao.insertAgo(favor);
	}else{
	dao.updateFavor(favor);
	}
	response.sendRedirect("longAgo.jsp");
	
	
	
	//GroupDAO의 insert호출
	
	//결과값을 json으로 리턴

%>
