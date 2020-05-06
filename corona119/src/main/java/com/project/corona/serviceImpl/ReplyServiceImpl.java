package com.project.corona.serviceImpl;

import java.util.List;

import com.project.corona.mapper.FreeboardMapper;
import com.project.corona.mapper.ReplyMapper;
import com.project.corona.service.FreeboardService;
import com.project.corona.service.ReplyService;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.ReplyVO;

import lombok.Setter;

public class ReplyServiceImpl implements ReplyService{
	
	@Setter
	private ReplyMapper replyMapper;
	
	@Override
	public List<ReplyVO> listReply(int boardNo){
		
		return replyMapper.listReply(boardNo);
	}
	
	@Override
	public void saveReply(ReplyVO reply) {
		
		replyMapper.saveReply(reply);

	}
	
	@Override
	public void updateReply(ReplyVO reply) {
		replyMapper.updateReply(reply);
	}

	@Override
	public void deleteReply(int rNo) {
		replyMapper.deleteReply(rNo);
	}

	

}
