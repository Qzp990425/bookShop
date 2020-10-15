package com.zj.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zj.dao.LogMapper;
import com.zj.entity.LogRecord;
import com.zj.service.LogService;
import com.zj.utils.Util;

@Service
public class LogServiceImpl implements LogService{
	
	@Autowired
	LogMapper logMapper;
	
	public void insertLog(String content) {
		LogRecord logRecord = new LogRecord();
		logRecord.setCreateTime(Util.formatDate(new Date()));
		logRecord.setContent(content);
		logMapper.insertLog(logRecord);
	
	}

	@Override
	public PageInfo<LogRecord> getAllLog(Integer pageNum) {
		PageHelper.startPage(pageNum, 12);
		List<LogRecord> logs = logMapper.getAllLog();
		return new PageInfo<>(logs);
	}
}
