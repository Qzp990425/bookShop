package com.zj.service;

import java.util.List;

import com.zj.entity.ShopCar;
import com.zj.entity.User;


public interface ShopCarService {
	
	public boolean addBook(ShopCar shopCar,User user);
	
	public List<ShopCar> getShopCar(User user);
	
	public boolean deleteShopCarBySid(Integer sid);
	
	public void updateNum(ShopCar shopCar);
	
	public void deleteShopCar(Integer[] sid);
}
