package com.zj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageInfo;
import com.zj.entity.User;
import com.zj.serviceImpl.UserServiceImpl;


@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserController {
	
	@Autowired
	UserServiceImpl userService;
	
	
	@RequestMapping("/login")
	public String login(Model model,User user) {
		boolean flag = userService.login(user);
		if(flag) {
			user = userService.getUserById(user);
			model.addAttribute("user",user);
			return "forward:/book/getBookOnSale";
		} else {
			model.addAttribute("msg","账号或者密码错误");
			return "/login";
		}
	}
	
	@RequestMapping("/register")
	public String register(Model model,User user) {
		boolean flag = userService.register(user);
		if(flag) {
			model.addAttribute("msg","注册成功");
		} else {
			model.addAttribute("msg","手机号已存在");
		}
		return "/register";
	}
	
	@RequestMapping("/update")
	public String update(Model model,User user) {
		boolean flag = userService.update(user);
		if(flag) {
			model.addAttribute("user", user);
			model.addAttribute("msg", "更新成功");
		} else {
			model.addAttribute("msg", "更新失败");
		}
		return "/user/userMsg";
	}
	
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.removeAttribute("user");
		return "/login";
	}
	
	@RequestMapping("/getAllUser")
	public String getAllUser(Model model,@RequestParam(defaultValue="1")Integer pageNum){
		PageInfo<User> pageInfo = userService.getAllUser(pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/user";
	}
}
