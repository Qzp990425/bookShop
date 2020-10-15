package com.zj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.zj.entity.ShopCar;
import com.zj.entity.User;
import com.zj.serviceImpl.ShopCarServiceImpl;



@Controller
@RequestMapping("/shopCar")
@SessionAttributes("user")
public class ShopCarController {
	
	@Autowired
	ShopCarServiceImpl shopCarService;
	
	@RequestMapping("/addBook")
	public String addBook(ModelMap model,ShopCar shopCar) {
		User user = (User)model.get("user");
		boolean flag = shopCarService.addBook(shopCar,user);
		if(flag) {
			model.addAttribute("msg","添加成功");
		} else {
			model.addAttribute("msg","添加失败");
		}
		return "forward:/book/getBookByBId?bid="+shopCar.getBid();
	}
	
	@RequestMapping("/addBookIndex")
	public String addBookIndex(ModelMap model,ShopCar shopCar) {
		User user = (User)model.get("user");
		boolean flag = shopCarService.addBook(shopCar,user);
		if(flag) {
			model.addAttribute("msg","添加成功");
		} else {
			model.addAttribute("msg","添加失败");
		}
		return "forward:/book/getBookOnSale";
	}
	
	
	@RequestMapping("/getShopCar")
	public String getShopCar(ModelMap model){
		User user = (User)model.get("user");
		List<ShopCar> shopCars = shopCarService.getShopCar(user);
		model.addAttribute("shopCars", shopCars);
		return "/shopCar";
	}
	
	@RequestMapping("/updateNum")
	public String updateNum(ShopCar shopCar) {
		shopCarService.updateNum(shopCar);
		return null;
	}
	
	@RequestMapping("/deleteById")
	public String deleteById(Integer sid,Model model) {
		boolean flag = shopCarService.deleteShopCarBySid(sid);
		if(flag) {
			model.addAttribute("msg", "删除成功");
		} else {
			model.addAttribute("msg", "删除失败");
		}
		return "forward:/shopCar/getShopCar";
	}
}
