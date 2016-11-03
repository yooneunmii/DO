package com.dev.doodle.vo;

public class User {

	private int no,writtenCount,followerCount;
	private String id,password,nickname,name,profile,phone,intro;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String id, String password, String nickname, String name, String profile, String phone) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.name = name;
		this.profile = profile;
		this.phone = phone;
	}
	public User(String a, String b,int c) {
		if(c==0) {
			this.id = a;
			this.password =b;
		} else if (c==1) {
			this.nickname = a;
		    this.phone = b;
		}
	}
	
	public User(String id, String nickname, String phone) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.phone = phone;
	}


	public User(int no, String id, String password, String nickname, String name, String profile, String phone,
			String intro) {
		super();
		this.no = no;
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.name = name;
		this.profile = profile;
		this.phone = phone;
		this.intro = intro;
	}	
	
	public User(int no, String password, String nickname, String name, String profile, String phone, String intro) {
		super();
		this.no = no;
		this.password = password;
		this.nickname = nickname;
		this.name = name;
		this.profile = profile;
		this.phone = phone;
		this.intro = intro;
	}
	
	public User(String id, String password) {
		super();
		this.id = id;
		this.password = password;
		}
	
	
	
	
	public int getWrittenCount() {
		return writtenCount;
	}

	public void setWrittenCount(int writtenCount) {
		this.writtenCount = writtenCount;
	}

	public int getFollowerCount() {
		return followerCount;
	}

	public void setFollowerCount(int followerCount) {
		this.followerCount = followerCount;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickName(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	
}
