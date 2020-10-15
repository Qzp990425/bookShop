package com.zj.service;

import com.github.pagehelper.PageInfo;
import com.zj.entity.OrderRecord;
import com.zj.entity.User;

public interface OrderService {
	
	public void insertOrder(User user,Integer[] pid,Integer[] number);
	
	public PageInfo<OrderRecord> getOrderByUid(User user,Integer pageNum);
	
	//发货
	public boolean sendOrder(Integer oid);
	
	//收货
	public boolean doneOrder(Integer oid);
	
	public PageInfo<OrderRecord> getAllOrder(Integer pageNum);
	
	public PageInfo<OrderRecord> getOrderByType(Integer pageNum,Integer type);
}
