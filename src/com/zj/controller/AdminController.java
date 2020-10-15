package com.zj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.zj.entity.Admin;
import com.zj.serviceImpl.AdminServiceImpl;
import com.zj.serviceImpl.LogServiceImpl;


@Controller
@RequestMapping("/admin")
@SessionAttributes("admin")
public class AdminController {
	
	@Autowired
	AdminServiceImpl adminService;
	@Autowired
	LogServiceImpl logSerivce;
	
	@RequestMapping("/login")
	public String login(Model model,Admin admin) {
		boolean flag = adminService.login(admin);
		if(flag) {
			logSerivce.insertLog(admin.getUsername()+"管理员登录了");
			model.addAttribute("admin",admin);
			return "/admin/main";
		} else {
			model.addAttribute("msg","账号或者密码错误");
			return "/admin/login";
		}
	}
	
	
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.removeAttribute("admin");
		return "/admin/login";
	}
}
