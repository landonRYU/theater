package com.ezvtheater;

import java.sql.Timestamp;

public class MemberVO {
	private String id;
	private String pw;
	private String email;
	private String tel;
	private String interests;
	private String job;
	private int age;
	private String introduce;
	private Timestamp regdate;
	
	public MemberVO() {
	}
	
	
	public MemberVO(String id, String email, String tel, String interests, String job, int age,
			String introduce, Timestamp regdate) {
		super();
		this.id = id;
		this.email = email;
		this.tel = tel;
		this.interests = interests;
		this.job = job;
		this.age = age;
		this.introduce = introduce;
		this.regdate = regdate;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getInterests() {
		return interests;
	}
	public void setInterests(String interests) {
		this.interests = interests;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
