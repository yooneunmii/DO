package com.dev.doodle.vo;

import java.sql.Timestamp;

public class OldContent {
			 
	 private int no,userNo,oldNo,like,unlike;
	 private String content,oldName,img,userName,profile,nickname;
	 private Timestamp regdate;
	 
	 
	 


	public OldContent(int userNo, int oldNo, String content) {
		super();
		this.userNo = userNo;
		this.oldNo = oldNo;
		this.content = content;
	}

	public OldContent() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	
	
	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getUnlike() {
		return unlike;
	}

	public void setUnlike(int unlike) {
		this.unlike = unlike;
	}

	public int getOldNo() {
		return oldNo;
	}

	public void setOldNo(int oldNo) {
		this.oldNo = oldNo;
	}

	public String getUserName() {
		return userName;
	}
	
	
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
	public String getProfile() {
		return profile;
	}
	
	
	
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	
	public String getNickname() {
		return nickname;
	}
	
	
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	


	public String getOldName() {
		return oldName;
	}



	public void setOldName(String oldName) {
		this.oldName = oldName;
	}



	public String getImg() {
		return img;
	}



	public void setImg(String img) {
		this.img = img;
	}



	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Timestamp getRegdate() {
		return regdate;
	}



	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	 
	 
	 
	 
	 

}
