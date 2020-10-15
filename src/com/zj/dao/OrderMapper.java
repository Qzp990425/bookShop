package com.zj.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zj.entity.OrderRecord;
import com.zj.entity.User;




@Repository
public interface OrderMapper {
	
	public void insertOrder(List<OrderRecord> list);
	
	public List<OrderRecord> getOrderByUid(User user);
	
	//发货 将状态改为1
	public Integer updateOrderStatusToOne(OrderRecord orderRecord);
	
	//收货  将状态改为2
	public Integer updateOrderStatusToTwo(OrderRecord orderRecord);
	
	public List<OrderRecord> getAllOrder();
	
	public List<OrderRecord> getOrderByType(Integer status);
}
