<%@page import="com.dev.doodle.dao.UsersDAO"%>
<%@page import="com.dev.doodle.util.ResizeImageUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Date" %>
<%@page import="com.dev.doodle.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	  String path = application.getRealPath("");

		//파일 업로드 할 경로
	  String uploadPath = path+"upload";
	  MultipartRequest mr = 
			  new MultipartRequest(request,uploadPath,1024*1024*100,"UTF-8",
			  new DefaultFileRenamePolicy());
	  String profile = mr.getFilesystemName("profile");
	  if(profile==null){
		  profile="default.png";
	  }
	  
	  
	  String id = mr.getParameter("id");
	  	String password = mr.getParameter("password");
		String nickname = mr.getParameter("nickname");
		String phone1 = mr.getParameter("phone1");
		String phone2 = mr.getParameter("phone2");
		String phone3 = mr.getParameter("phone3");
		String name = mr.getParameter("name");
		
		String phone = phone1+phone2+phone3;
		
	String source = uploadPath+File.separator+profile; // 경로+파일명
	String target = path+"profile"+File.separator+profile;//경로+파일명
	ResizeImageUtil.resize(source, target, 200);
	
		
	User user = new User(id,password,nickname,name,profile,phone);
	
	boolean result= UsersDAO.getDAO().insert(user);
	

	if(result) {
		//세션에 로그인성공 메세지를 저장
		session.setAttribute("", "회원가입이 잘 되었습니다. 로그인하세요.");
		
	
		response.sendRedirect("indexMain.jsp");
	}else {
		
		response.sendRedirect("joinForm.jsp");
	}
	

	
%>
