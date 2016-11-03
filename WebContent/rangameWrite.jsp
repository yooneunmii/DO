<%@page import="javax.websocket.SendResult"%>
<%@page import="com.dev.doodle.dao.ParagraphDAO"%>
<%@page import="com.dev.doodle.vo.Paragraph"%>
<%@page import="com.dev.doodle.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	
	
	User loginUser = (User)session.getAttribute("loginUser");
	
	String method = request.getMethod();


	if(method.equalsIgnoreCase("POST") && loginUser!=null) {

		
		ParagraphDAO dao= ParagraphDAO.getDAO();
		
		 request.setCharacterEncoding("UTF-8");
		 
		String noStr = request.getParameter("no");
		int boardNo=Integer.parseInt(noStr);
		String markup = (String) session.getAttribute("body");
		session.removeAttribute("body");
		int userNo= loginUser.getNo();
		String img= (String) session.getAttribute("img");
		session.removeAttribute("img");
		
		if(img==null){
			img="null";
		}
		Paragraph paragraph =new Paragraph(userNo,boardNo,markup,img);
		
		boolean a=dao.ranInsert(paragraph);
		
		response.sendRedirect("random.jsp");
	}else{
		response.sendRedirect("indexMain.jsp");
	}
%>
