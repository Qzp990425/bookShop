package com.zj.entity;


//商品实体
public class Book {
	private Integer bid;
	//商品编号
	private String uuid;
	//商品名
	private String name;
	//价格
	private Integer price;
	//类型(0-育儿书  1-散文书  2-工具书  3-专业书)
	private Integer type;
	//商品简介
	private String introduction;
	//商品状态(0-正在售卖  1-售空)
	private Integer status;


	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getPrice() {
		return price;
	}
	
	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getIntroduction() {
		return introduction;
	}

	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	@Override
	public String toString() {
		return "Book [bid=" + bid + ", uuid=" + uuid + ", name=" + name + ", price=" + price + ", type=" + type
				+ ", introduction=" + introduction + ", status=" + status + "]";
	}
	
	
}
