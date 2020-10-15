package com.zj.service;

import java.util.List;

import com.zj.entity.Talk;

public interface TalkService {
	
	public  List<Talk> getTalkByBid(Integer bid);
	
	public boolean deleteTalkByTid(Integer tid);
	
	public boolean insertTalk(Talk talk);
}
