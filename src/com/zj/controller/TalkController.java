package com.zj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zj.entity.Talk;
import com.zj.serviceImpl.TalkServiceImpl;

@Controller
@RequestMapping("/talk")
public class TalkController {
	
	@Autowired
	TalkServiceImpl talkService;
	
	@RequestMapping("/deleteTalk")
	public String deleteTalk(Integer tid,Model model,Integer bid) {
		model.addAttribute("msg", talkService.deleteTalkByTid(tid) == true?"删除成功":"删除失败");
		return "forward:/book/getBookByBId?bid="+bid;
	}
	
	@RequestMapping("/insertTalk")
	public String insertTalk(Talk talk,Model model) {
		model.addAttribute("msg", talkService.insertTalk(talk)==true?"添加成功":"添加失败");
		return "forward:/book/getBookByBId?bid="+talk.getBid();
	}
}
