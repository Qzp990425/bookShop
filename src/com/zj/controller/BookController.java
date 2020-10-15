package com.zj.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.zj.entity.Book;
import com.zj.entity.Talk;
import com.zj.serviceImpl.BookServiceImpl;
import com.zj.serviceImpl.LogServiceImpl;
import com.zj.serviceImpl.TalkServiceImpl;
import com.zj.utils.FileNameUtil;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	BookServiceImpl bookService;
	@Autowired
	LogServiceImpl logSerivce;
	@Autowired
	TalkServiceImpl talkService;
	
	@RequestMapping("/getBookOnSale")
	public String getBookOnSale(Model model,@RequestParam(defaultValue="1")Integer pageNum) {
		PageInfo<Book> pageInfo = bookService.getBookOnSale(pageNum);
		model.addAttribute("pageInfo",pageInfo);
		return "/Hall";
	}
	
	@RequestMapping("/getBookOnSaleByType")
	public String getBookOnSale(Model model,@RequestParam(defaultValue="1")Integer pageNum,Integer type) {
		PageInfo<Book> pageInfo = bookService.getBookOnSaleByType(type, pageNum);
		model.addAttribute("type", type);
		model.addAttribute("pageInfo",pageInfo);
		return "/Hall";
	}
	
	@RequestMapping("/getBookByBId")
	public String getBookByPId(Model model,Integer bid) {
		Book book = bookService.getBookByBid(bid);
		List<Talk> talks = talkService.getTalkByBid(bid);
		model.addAttribute("book",book);
		model.addAttribute("talks", talks);
		return "/detail";
	}
	
	@RequestMapping("/getAllBook")
	public String getAllBook(Model model,@RequestParam(defaultValue="1")Integer pageNum) {
		PageInfo<Book> pageInfo = bookService.getAllBook(pageNum);
		model.addAttribute("pageInfo",pageInfo);
		return "/admin/book";
	}
	
	@RequestMapping("/getAllBookByType")
	public String getAllBookByType(Model model,@RequestParam(defaultValue="1")Integer pageNum,Integer type) {
		PageInfo<Book> pageInfo = bookService.getAllBookByType(type, pageNum);
		model.addAttribute("type",type);
		model.addAttribute("pageInfo",pageInfo);
		return "/admin/book";
	}
	
	@RequestMapping("/putBook")
	public String putBook(Model model,Integer bid){
		boolean flag = bookService.putBook(bid);
		if(flag) {
			logSerivce.insertLog("商品号为"+bid+"的书籍下架了");
			model.addAttribute("msg", "下架成功");
		} else {
			model.addAttribute("msg", "下架失败");
		}
		return "forward:/book/getAllBook";
	}
	
	@RequestMapping("/pushBook")
	public String pushBook(Model model,Integer bid){
		boolean flag = bookService.pushBook(bid);
		if(flag) {
			logSerivce.insertLog("商品号为"+bid+"的手机上架了");
			model.addAttribute("msg", "上架成功");
		} else {
			model.addAttribute("msg", "上架失败");
		}
		return "forward:/book/getAllBook";
	}
	
	@RequestMapping("/addBook")
	public String addBook(@RequestParam MultipartFile bookImg,HttpServletRequest request,Model model,Book book) {
		//创建存储的文件名
		String uuid = FileNameUtil.getUUIDFileName();
        String saveFileName = uuid + FileNameUtil.getFileType(bookImg.getOriginalFilename());        
        //找到存储的路径
        String path  = request.getServletContext().getRealPath("/bookImg");
        System.out.println(path+saveFileName);
        //转存
        try {
        	bookImg.transferTo(new File(path+saveFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        book.setUuid(uuid);
        boolean flag = bookService.addBook(book);
        if(flag) {
        	logSerivce.insertLog("上架新书籍了:名称为"+book.getName()+",售价为"+book.getPrice());
        	model.addAttribute("msg","添加成功");
        } else {
        	model.addAttribute("msg","添加失败");
        }
        return "/admin/book_add";
	}
	
	@RequestMapping("/getBookByName")
	public String getBookByName(Model model,String name,@RequestParam(defaultValue="1")Integer pageNum) {
		PageInfo<Book> pageInfo = bookService.getBookByName(pageNum, name);
		model.addAttribute("name", name);
		model.addAttribute("pageInfo",pageInfo);
		return "/Hall";
	}
}
