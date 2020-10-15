package com.zj.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zj.dao.TalkMapper;
import com.zj.dao.UserMapper;
import com.zj.entity.Talk;
import com.zj.service.TalkService;
import com.zj.utils.Util;

@Service
public class TalkServiceImpl implements TalkService {
	
	@Autowired
	TalkMapper talkMapper;
	@Autowired
	UserMapper userMapper;
	
	@Override
	public List<Talk> getTalkByBid(Integer bid) {
		List<Talk> list = talkMapper.getTalkByBid(bid);
		for(int i = 0 ; i < list.size() ; i ++) {
			Talk talk = list.get(i);
			talk.setUser(userMapper.getUserByUid(talk.getUid()));
			list.remove(i);
			list.add(i, talk);
		}
		return list;
	}

	@Override
	public boolean deleteTalkByTid(Integer tid) {
		return talkMapper.deleteTalk(tid) > 0;
	}

	@Override
	public boolean insertTalk(Talk talk) {
		// TODO Auto-generated method stub
		talk.setSendTime(Util.formatDate(new Date()));
		return talkMapper.insertTalk(talk) > 0;
	}

}
