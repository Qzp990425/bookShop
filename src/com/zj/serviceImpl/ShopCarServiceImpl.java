package com.zj.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zj.dao.BookMapper;
import com.zj.dao.ShopCarMapper;
import com.zj.entity.Book;
import com.zj.entity.ShopCar;
import com.zj.entity.User;
import com.zj.service.ShopCarService;


@Service
public class ShopCarServiceImpl implements ShopCarService {
	
	@Autowired
	ShopCarMapper shopCarMapper;
	@Autowired
	BookMapper bookMapper;
	
	@Override
	public boolean addBook(ShopCar shopCar,User user) {
		List<ShopCar> shopCars = shopCarMapper.getShopCar(user);
		for(int i = 0 ; i < shopCars.size(); i++) {
			if(shopCars.get(i).getBid().equals(shopCar.getBid())) {
				return false;
			}			
		} 
		shopCar.setUid(user.getUid());
		Integer result = shopCarMapper.addBook(shopCar);	
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}


	@Override
	public List<ShopCar> getShopCar(User user) {
		List<ShopCar> shopCars = shopCarMapper.getShopCar(user);
		for(int i = 0 ; i < shopCars.size() ; i++) {
			ShopCar shopCar = shopCars.get(i);		
			Book book = bookMapper.getBookByBid(shopCar.getBid());
			shopCar.setBook(book);
			shopCars.remove(i);
			shopCars.add(i, shopCar);
		}
		return shopCars;
	}


	@Override
	public boolean deleteShopCarBySid(Integer sid) {
		Integer result = shopCarMapper.deleteShopCarBySid(sid);
		if(result == 1) {
			return true;
		} else {
			return false;
		}		
	}


	@Override
	public void updateNum(ShopCar shopCar) {
		shopCarMapper.updateNum(shopCar);		
	}


	@Override
	public void deleteShopCar(Integer[] sid) {
		// TODO Auto-generated method stub
		shopCarMapper.deleteShopCar(sid);
	}

}
