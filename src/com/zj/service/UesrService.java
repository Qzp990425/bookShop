package com.zj.service;

import com.github.pagehelper.PageInfo;
import com.zj.entity.User;

public interface UesrService {
	
	public boolean login(User user);
	
	public boolean register(User user);
	
	public User getUserById(User user);
	
	public boolean update(User user);
	
	public PageInfo<User> getAllUser(Integer pageNum);
}
