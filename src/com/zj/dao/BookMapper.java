package com.zj.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zj.entity.Book;





@Repository
public interface BookMapper {

	public List<Book> getAllBook();
	
	public List<Book> getBookByType(Integer type);
	
	public List<Book> getBookOnSale();

	public List<Book> getBookOnSaleByType(Integer type);
	
	public Integer insertBook(Book book);
	
	public Integer putBook(Integer id);
	
	public Integer pushBook(Integer id);
	
	public Book getBookByBid(Integer id);
	
	public Integer addBook(Book book);
	
	public List<Book> getBookByName(String name);
}
