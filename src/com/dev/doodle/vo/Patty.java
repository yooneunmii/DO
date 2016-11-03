package com.dev.doodle.vo;

import java.sql.Timestamp;

public class Patty {
			 
	 private int no,userNo,burgerNo;
	 private String content,nickName,profile,startSentence,endSentence;
	 private Timestamp regdate;
	 
	 
	 
	 
	 public String getStartSentence() {
		return startSentence;
	}




	public void setStartSentence(String startSentence) {
		this.startSentence = startSentence;
	}




	public String getEndSentence() {
		return endSentence;
	}




	public void setEndSentence(String endSentence) {
		this.endSentence = endSentence;
	}




	public Patty(int userNo, int burgerNo, String content) {
		super();
		this.userNo = userNo;
		this.burgerNo = burgerNo;
		this.content = content;
	}




	public Patty() {
		// TODO Auto-generated constructor stub
	}




	public String getNickName() {
		return nickName;
	}




	public void setNickName(String nickName) {
		this.nickName = nickName;
	}




	public String getProfile() {
		return profile;
	}




	public void setProfile(String profile) {
		this.profile = profile;
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




	public int getBurgerNo() {
		return burgerNo;
	}




	public void setBurgerNo(int burgerNo) {
		this.burgerNo = burgerNo;
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
