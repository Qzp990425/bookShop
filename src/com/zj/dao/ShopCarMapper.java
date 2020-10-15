package com.zj.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zj.entity.ShopCar;
import com.zj.entity.User;

@Repository
public interface ShopCarMapper {
	
	public Integer addBook(ShopCar shopCar);
	
	public List<ShopCar> getShopCar(User user);
	
	public Integer deleteShopCarBySid(Integer sid);	
	
	public void updateNum(ShopCar shopCar);
	
	public void deleteShopCar(Integer[] sid);
}
