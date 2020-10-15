package com.zj.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zj.dao.UserMapper;
import com.zj.entity.User;
import com.zj.service.UesrService;
import com.zj.utils.Util;

@Service
public class UserServiceImpl implements UesrService{
	
	@Autowired
	UserMapper userMapper;
	
	
	public boolean login(User user) {
		User checkUser = userMapper.getUserByTel(user);
		if(checkUser == null) {
			return false;
		} else {
			if(checkUser.getPassword().equals(user.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	public boolean register(User user) {
		User checkUser = userMapper.getUserByTel(user);
		if(checkUser == null) {
			user.setCreateTime(Util.formatDate(new Date()));
			userMapper.insertUser(user);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public User getUserById(User user) {
		User checkUser = userMapper.getUserByTel(user);
		return checkUser;
	}

	@Override
	public boolean update(User user) {
		// TODO Auto-generated method stub
		Integer result = userMapper.updateUserByTel(user);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PageInfo<User> getAllUser(Integer pageNum) {
		PageHelper.startPage(pageNum, 5);
		List<User> users = userMapper.getAllUser();
		return new PageInfo<>(users);
	}
	
}
