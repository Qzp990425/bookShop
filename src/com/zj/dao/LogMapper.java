package com.zj.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.zj.entity.LogRecord;


@Repository
public interface LogMapper {
	
	public void insertLog(LogRecord logRecord);
	
	public List<LogRecord> getAllLog();
}
