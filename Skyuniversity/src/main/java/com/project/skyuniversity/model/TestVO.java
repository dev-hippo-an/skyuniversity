package com.project.skyuniversity.model;

public class TestVO {
	private String no;
	private String name;
	private String writeday;
	
	public TestVO() {
		// TODO Auto-generated constructor stub
	}

	public TestVO(String no, String name, String writeday) {
		super();
		this.no = no;
		this.name = name;
		this.writeday = writeday;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	
	
}
