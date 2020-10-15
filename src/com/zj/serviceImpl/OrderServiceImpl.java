package com.zj.serviceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zj.dao.BookMapper;
import com.zj.dao.OrderMapper;
import com.zj.entity.OrderRecord;
import com.zj.entity.User;
import com.zj.service.OrderService;
import com.zj.utils.Util;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderMapper orderMapper;
	@Autowired
	BookMapper bookMapper;
	
	
	@Override
	public void insertOrder(User user, Integer[] bid, Integer[] number) {
		List<OrderRecord> orderRecords = new ArrayList<OrderRecord>();
		for(int i = 0; i < bid.length ; i ++) {
			OrderRecord orderRecord = new OrderRecord();
			orderRecord.setBuyId(user.getUid());
			orderRecord.setBid(bid[i]);
			orderRecord.setNumber(number[i]);
			orderRecord.setCreateTime(Util.formatDate(new Date()));
			orderRecord.setStatus(0);
			orderRecord.setUuid(Util.getRandomUUID());
			orderRecords.add(orderRecord);
		}
		orderMapper.insertOrder(orderRecords);
	}

	@Override
	public PageInfo<OrderRecord> getOrderByUid(User user,Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 5);
		List<OrderRecord> orderRecords = orderMapper.getOrderByUid(user);
		for(int i = 0 ; i < orderRecords.size(); i ++) {
			OrderRecord orderRecord = orderRecords.get(i);
			orderRecord.setBook(bookMapper.getBookByBid(orderRecord.getBid()));
			orderRecords.remove(i);
			orderRecords.add(i, orderRecord);
		}
		return new PageInfo<>(orderRecords);
	}

	@Override
	public boolean sendOrder(Integer oid) {
		OrderRecord orderRecord = new OrderRecord();
		orderRecord.setOid(oid);
		orderRecord.setSendTime(Util.formatDate(new Date()));
		Integer result = orderMapper.updateOrderStatusToOne(orderRecord);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean doneOrder(Integer oid) {
		OrderRecord orderRecord = new OrderRecord();
		orderRecord.setOid(oid);
		orderRecord.setDoneTime(Util.formatDate(new Date()));
		Integer result = orderMapper.updateOrderStatusToTwo(orderRecord);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PageInfo<OrderRecord> getAllOrder(Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		List<OrderRecord> orderRecords = orderMapper.getAllOrder();
		for(int i = 0 ; i < orderRecords.size(); i ++) {
			OrderRecord orderRecord = orderRecords.get(i);
			orderRecord.setBook(bookMapper.getBookByBid(orderRecord.getBid()));
			orderRecords.remove(i);
			orderRecords.add(i, orderRecord);
		}
		return new PageInfo<>(orderRecords);
	}

	@Override
	public PageInfo<OrderRecord> getOrderByType(Integer pageNum, Integer type) {
		PageHelper.startPage(pageNum, 3);
		List<OrderRecord> orderRecords = orderMapper.getOrderByType(type);
		for(int i = 0 ; i < orderRecords.size(); i ++) {
			OrderRecord orderRecord = orderRecords.get(i);
			orderRecord.setBook(bookMapper.getBookByBid(orderRecord.getBid()));
			orderRecords.remove(i);
			orderRecords.add(i, orderRecord);
		}
		return new PageInfo<>(orderRecords);
	}
	
}
