package com.zj.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zj.entity.Talk;

@Repository
public interface TalkMapper {
	
	public List<Talk> getTalkByBid(Integer bid);
	
	public Integer deleteTalk(Integer tid);
	
	public Integer insertTalk(Talk talk);
	
}
