package yong.bbs.model;

import java.sql.*;

public class BbsDTO {
	private int idx;
	private String writer;
	private String pwd;
	private String subject;
	private String content;
	private java.sql.Date writedate;
	private int readnum;
	private int ref;
	private int lev;
	private int sunbun;
	private int rnum;
	
	 public BbsDTO() {
		 System.out.println("BbsDTO 생성!!");
	}

	 /**글 내용보기 생성자*/
	 public BbsDTO(int idx, String writer, String subject, String content, Date writedate, int readnum) {
			super();
			this.idx = idx;
			this.writer = writer;
			this.subject = subject;
			this.content = content;
			this.writedate = writedate;
			this.readnum = readnum;
		}
	
	 /**글쓰기 생성자*/
	public BbsDTO(String writer, String pwd, String subject, String content) {
		super();
		this.writer = writer;
		this.pwd = pwd;
		this.subject = subject;
		this.content = content;
	}


	public BbsDTO(int idx, String writer, String subject, String content, Date writedate, int readnum, int rnum) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.readnum = readnum;
		this.rnum = rnum;
	}



	public BbsDTO(int idx, String writer, String pwd, String subject, String content, Date writedate, int readnum,
			int ref, int lev, int sunbun) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.pwd = pwd;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}

	public BbsDTO(int idx, String writer, String pwd, String subject, String content, Date writedate, int readnum,
			int ref, int lev, int sunbun, int rnum) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.pwd = pwd;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
		this.rnum = rnum;
	}




	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.sql.Date getWritedate() {
		return writedate;
	}

	public void setWritedate(java.sql.Date writedate) {
		this.writedate = writedate;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	 
	
}
