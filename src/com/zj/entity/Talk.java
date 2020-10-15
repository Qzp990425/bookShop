package com.zj.entity;

public class Talk {
	//讨论id
	private Integer tid;
	//用户id
	private Integer uid;
	//评论的书id
	private Integer bid;
	//评论内容
	private String content;
	//评论时间
	private String sendTime;
	
	private User user;
	private Book book;
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	@Override
	public String toString() {
		return "Talk [tid=" + tid + ", uid=" + uid + ", bid=" + bid + ", content=" + content + ", sendTime=" + sendTime
				+ ", user=" + user + ", book=" + book + "]";
	}
	
	
}
