package com.zj.entity;


public class LogRecord {
	
	private Integer id;
	//日志内容
	private String content;
	//创建时间
	private String createTime;
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "LogRecord [id=" + id + ", content=" + content + ", createTime=" + createTime + "]";
	}
	
}
