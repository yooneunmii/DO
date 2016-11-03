package com.dev.doodle.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Paragraph {
private int no,userNo,boardNo,categoryNo,up,down;
private String content,img,result,nickname,profile,title,lastLine;
private Timestamp regdate;
private Date dateRegdate;
private int start, end;


public Paragraph(int start, int end) {
   super();
   this.start = start;
   this.end = end;
}
public Date getDateRegdate() {
	return dateRegdate;
}

public void setDateRegdate(Date dateRegdate) {
	this.dateRegdate = dateRegdate;
}

public String getLastLine() {
	return lastLine;
}



public void setLastLine(String lastLine) {
	this.lastLine = lastLine;
}



public int getCategoryNo() {
	return categoryNo;
}



public void setCategoryNo(int categoryNo) {
	this.categoryNo = categoryNo;
}



public int getUp() {
	return up;
}



public void setUp(int up) {
	this.up = up;
}



public int getDown() {
	return down;
}



public void setDown(int down) {
	this.down = down;
}




public Paragraph(int userNo, int boardNo, String content, String img) {
	super();
	this.userNo = userNo;
	this.boardNo = boardNo;
	this.content = content;
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
public int getBoardNo() {
	return boardNo;
}
public void setBoardNo(int boardNo) {
	this.boardNo = boardNo;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public String getResult() {
	return result;
}
public void setResult(String result) {
	this.result = result;
}
public Timestamp getRegdate() {
	return regdate;
}
public void setRegdate(Timestamp regdate) {
	this.regdate = regdate;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public String getProfile() {
	return profile;
}
public void setProfile(String profile) {
	this.profile = profile;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public Paragraph() {
	super();
}

}
