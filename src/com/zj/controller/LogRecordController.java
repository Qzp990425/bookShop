package com.zj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.zj.entity.LogRecord;
import com.zj.serviceImpl.LogServiceImpl;

@Controller
@RequestMapping("/logRecord")
public class LogRecordController {
	
	@Autowired
	LogServiceImpl logService;
	
	@RequestMapping("/getAllLog")
	public String getAllLog(Model model,@RequestParam(defaultValue="1") Integer pageNum) {
		PageInfo<LogRecord> pageInfo = logService.getAllLog(pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/logRecord";
	}
}
