package com.zj.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zj.dao.BookMapper;
import com.zj.entity.Book;
import com.zj.service.BookService;

@Service
public class BookServiceImpl implements BookService{
	
	@Autowired
	BookMapper bookMapper;
	
	
	@Override
	public PageInfo<Book> getAllBook(Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		List<Book> books = bookMapper.getAllBook();
		return new PageInfo<>(books);
	}

	@Override
	public PageInfo<Book> getAllBookByType(Integer type, Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		List<Book> books = bookMapper.getBookByType(type);
		return new PageInfo<>(books);
	}

	@Override
	public PageInfo<Book> getBookOnSale(Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		List<Book> books = bookMapper.getBookOnSale();
		return new PageInfo<>(books);
	}

	@Override
	public PageInfo<Book> getBookOnSaleByType(Integer type, Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		List<Book> books = bookMapper.getBookOnSaleByType(type);
		return new PageInfo<>(books);
	}

	@Override
	public Book getBookByBid(Integer bid) {
		Book book = bookMapper.getBookByBid(bid);
		return book;
	}

	@Override
	public boolean putBook(Integer bid) {
		Integer result = bookMapper.putBook(bid);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean pushBook(Integer bid) {
		Integer result = bookMapper.pushBook(bid);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean addBook(Book book) {
		// TODO Auto-generated method stub
		Integer result = bookMapper.addBook(book);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PageInfo<Book> getBookByName(Integer pageNum, String name) {
		PageHelper.startPage(pageNum, 4);
		List<Book> books = bookMapper.getBookByName(name);
		return new PageInfo<>(books);
	}

}
