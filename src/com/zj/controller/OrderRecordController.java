package com.zj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageInfo;
import com.zj.entity.OrderRecord;
import com.zj.entity.User;
import com.zj.serviceImpl.LogServiceImpl;
import com.zj.serviceImpl.OrderServiceImpl;
import com.zj.serviceImpl.ShopCarServiceImpl;

@Controller
@RequestMapping("/orderRecord")
@SessionAttributes("user")
public class OrderRecordController {

	@Autowired
	OrderServiceImpl orderService;
	@Autowired
	ShopCarServiceImpl shopCarService;
	@Autowired
	LogServiceImpl logService;
	
	@RequestMapping("/insertOrder")
	public String insertOrder(ModelMap model,Integer[] bid,Integer[] number,Integer[] sid) {
		User user = (User)model.get("user");
		orderService.insertOrder(user, bid, number);
		model.addAttribute("msg","支付成功");
		shopCarService.deleteShopCar(sid);
		logService.insertLog(user.getName()+"用户创建了新的订单");
		return "forward:/shopCar/getShopCar";	
	}
	
	@RequestMapping("/getOrderByUid")
	public String getOrderByUid(ModelMap model,@RequestParam(defaultValue="1")Integer pageNum) {
		User user = (User)model.get("user");
		PageInfo<OrderRecord> pageInfo = orderService.getOrderByUid(user, pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "/user/userOrder";
	}
	
	@RequestMapping("/sendOrder")
	public String sendOrder(Model model,Integer oid) {
		boolean flag = orderService.sendOrder(oid);		
		if(flag) {
			logService.insertLog("订单号为"+oid+"的订单发货了");
			model.addAttribute("msg","发货成功");
		} else {
			model.addAttribute("msg","发货失败");
		}
		return "forward:/orderRecord/getOrderByType?status=0";
	}
	
	@RequestMapping("/doneOrder")
	public String doneOrder(Model model,Integer oid) {
		boolean flag = orderService.doneOrder(oid);
		if(flag) {
			logService.insertLog("订单号为"+oid+"的订单收货了");
			model.addAttribute("msg","收货成功");
		} else {
			model.addAttribute("msg","收货失败");
		}
		return "forward:/orderRecord/getOrderByUid";
	}
	
	@RequestMapping("/getAllOrder")
	public String getAllOrder(Model model,@RequestParam(defaultValue="1")Integer pageNum){
		PageInfo<OrderRecord> pageInfo = orderService.getAllOrder(pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/orderRecord";
	}
	
	@RequestMapping("/getOrderByType")
	public String getOrderByType(Model model,@RequestParam(defaultValue="1")Integer pageNum,Integer status){
		PageInfo<OrderRecord> pageInfo = orderService.getOrderByType(pageNum,status);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("status", status);
		return "/admin/order";
	}
}
