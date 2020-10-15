package com.zj.service;

import com.github.pagehelper.PageInfo;
import com.zj.entity.LogRecord;

public interface LogService {
	public void insertLog(String content);
	
	public PageInfo<LogRecord> getAllLog(Integer pageNum);
}
