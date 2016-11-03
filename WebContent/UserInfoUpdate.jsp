<%@page import="com.dev.doodle.util.BackupUtil"%>
<%@page import="com.sun.webkit.BackForwardList"%>
<%@page import="java.io.File"%>
<%@page import="com.dev.doodle.util.ResizeImageUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.dev.doodle.dao.UsersDAO"%>
<%@page import="com.dev.doodle.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//기본 서버의 경로
	String path = application.getRealPath("");

	//파일 업로드할 경로
	String uploadPath = path+"upload";
	
	MultipartRequest mr = new MultipartRequest(request,uploadPath,1024*1024*50,"UTF-8",new DefaultFileRenamePolicy());

	String noStr = mr.getParameter("no");
	int no = Integer.parseInt(noStr);
	String addFile = mr.getFilesystemName("addFile");
	String password = mr.getParameter("password");
	String name = mr.getParameter("name");
	String nickname = mr.getParameter("nickname");
	String phone1 = mr.getParameter("phone1");
	String phone2 = mr.getParameter("phone2");
	String phone3 = mr.getParameter("phone3");
	String intro = mr.getParameter("intro");
	
	System.out.println(addFile);
	
	String phone = phone1+phone2+phone3;
	
	//profile 사진을 c드라이브 backup 폴더에 저장한다 backup 폴더는 없어도 생성된다.
	BackupUtil.backup(uploadPath+File.separator+addFile, "c:backup");
	
	String source = uploadPath+File.separator+addFile;//경로+파일명
	String target = path+"profile"+File.separator+addFile;//경로+파일명
	
	ResizeImageUtil.resize(source, target, 200);
	
	if(addFile==null){
		//프로필이 없을 경우 기본이미지로 변경해 줍니다.
		addFile="Ax6ucK0h.jpeg";
	}//if(profile) end
	
	User user = new User(no,password,nickname,name,addFile,phone,intro);
	
	UsersDAO dao = UsersDAO.getDAO();
	boolean result = dao.update(user);
	
	if(result) {
		//리다이렉트
		//response.sendRedirect("userPage.jsp");
	} else {
		//response.sendRedirect("UserInfoUpdateForm.jsp");
	}//if(result) end

%>

<%= noStr %>
<%= addFile %>
<%= password %>
<%= name %>
<%= nickname %>
<%= phone %>
<%= intro %>

<%=result %>
