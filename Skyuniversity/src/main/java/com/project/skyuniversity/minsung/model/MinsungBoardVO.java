package com.project.skyuniversity.minsung.model;

import org.springframework.web.multipart.MultipartFile;

public class MinsungBoardVO {

	private String boardNo;			// 게시글 번호
	private String fk_boardKindNo;  // 게시판 번호
	private String fk_memberNo;		// 작성회원번호
	private String nickname;		// 작성회원닉네임
	private String fk_categoryno;	// 카테고리번호
	private String categoryName;	// 카테고리이름
	private String subject;			// 글 제목
	private String regDate;			// 등록일자
	private String editDate;		// 수정일자
	private String content;			// 글 내용
	private String readCount;		// 조회수
	private String status;			// 게시글 상태
	private String fileExist;		// 첨부파일 유무
	private String writerIp;		// 작성자 ip
	
	///////////////////////////////////////////
	private String upCount;			// 추천수
	private String downCount;		// 비추천수
	private String reportCount;		// 신고수
	private String fileCount;		// 첨부파일수
	
	private MultipartFile attach;
	
	private String fileName;    // WAS(톰캣)에 저장될 파일명(2020120809271535243254235235234.png) 
	private String orgFilename; // 진짜 파일명(강아지.png)  // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
	private String fileSize;
	
	public MinsungBoardVO() {}

	public MinsungBoardVO(String boardNo, String fk_boardKindNo, String fk_memberNo, String fk_categoryno, String subject,
			String regDate, String editDate, String content, String readCount, String status, String fileExist,
			String writerIp) {
		super();
		this.boardNo = boardNo;
		this.fk_boardKindNo = fk_boardKindNo;
		this.fk_memberNo = fk_memberNo;
		this.fk_categoryno = fk_categoryno;
		this.subject = subject;
		this.regDate = regDate;
		this.editDate = editDate;
		this.content = content;
		this.readCount = readCount;
		this.status = status;
		this.fileExist = fileExist;
		this.writerIp = writerIp;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getFk_boardKindNo() {
		return fk_boardKindNo;
	}

	public void setFk_boardKindNo(String fk_boardKindNo) {
		this.fk_boardKindNo = fk_boardKindNo;
	}

	public String getFk_memberNo() {
		return fk_memberNo;
	}

	public void setFk_memberNo(String fk_memberNo) {
		this.fk_memberNo = fk_memberNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFk_categoryno() {
		return fk_categoryno;
	}

	public void setFk_categoryno(String fk_categoryno) {
		this.fk_categoryno = fk_categoryno;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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

	public String getEditDate() {
		return editDate;
	}

	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReadCount() {
		return readCount;
	}

	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFileExist() {
		return fileExist;
	}

	public void setFileExist(String fileExist) {
		this.fileExist = fileExist;
	}

	public String getWriterIp() {
		return writerIp;
	}

	public void setWriterIp(String writerIp) {
		this.writerIp = writerIp;
	}

	public String getUpCount() {
		return upCount;
	}

	public void setUpCount(String upCount) {
		this.upCount = upCount;
	}

	public String getDownCount() {
		return downCount;
	}

	public void setDownCount(String downCount) {
		this.downCount = downCount;
	}

	public String getReportCount() {
		return reportCount;
	}

	public void setReportCount(String reportCount) {
		this.reportCount = reportCount;
	}

	public String getFileCount() {
		return fileCount;
	}

	public void setFileCount(String fileCount) {
		this.fileCount = fileCount;
	}

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOrgFilename() {
		return orgFilename;
	}

	public void setOrgFilename(String orgFilename) {
		this.orgFilename = orgFilename;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	

	
	
}
