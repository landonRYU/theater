package com.ezvtheater;

public class BoardVO {
	private int num;
	private String writer;
	private String email;
	private String title;
	private String pw;
	private String regDate;
	private int ref;
	private int	re_step;
	private int re_level;
	private int	readCount;
	private String content;
	

	public BoardVO(int num, String writer, String email, String title, String regDate, int readCount, String content, int re_level) {
		super();
		this.num = num;
		this.writer = writer;
		this.email = email;
		this.title = title;
		this.regDate = regDate;
		this.readCount = readCount;
		this.content = content;
		this.re_level = re_level;
	}

	public BoardVO() {
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	} 

	
	
}