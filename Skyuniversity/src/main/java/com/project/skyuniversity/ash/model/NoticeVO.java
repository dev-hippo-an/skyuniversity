package com.project.skyuniversity.ash.model;

public class NoticeVO {
	private int boardNo;
	private int fk_boardKindNo;
	private int fk_memberNo;
	private int fk_categoryNo;
	private String subject;
	private String regDate;
	private String content;
	private int readCount;
	private int status;
	private String writerIp;
	
	
	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}


	public NoticeVO(int boardNo, int fk_boardKindNo, int fk_memberNo, int fk_categoryNo, String subject, String regDate,
			String content, int readCount, int status, String writerIp) {
		super();
		this.boardNo = boardNo;
		this.fk_boardKindNo = fk_boardKindNo;
		this.fk_memberNo = fk_memberNo;
		this.fk_categoryNo = fk_categoryNo;
		this.subject = subject;
		this.regDate = regDate;
		this.content = content;
		this.readCount = readCount;
		this.status = status;
		this.writerIp = writerIp;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getFk_boardKindNo() {
		return fk_boardKindNo;
	}


	public void setFk_boardKindNo(int fk_boardKindNo) {
		this.fk_boardKindNo = fk_boardKindNo;
	}


	public int getFk_memberNo() {
		return fk_memberNo;
	}


	public void setFk_memberNo(int fk_memberNo) {
		this.fk_memberNo = fk_memberNo;
	}


	public int getFk_categoryNo() {
		return fk_categoryNo;
	}


	public void setFk_categoryNo(int fk_categoryNo) {
		this.fk_categoryNo = fk_categoryNo;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getReadCount() {
		return readCount;
	}


	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public String getWriterIp() {
		return writerIp;
	}


	public void setWriterIp(String writerIp) {
		this.writerIp = writerIp;
	}
	
	
}
