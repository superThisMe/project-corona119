package com.project.corona.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.ReplyVO;

@Mapper
public interface ReplyMapper {


	List<ReplyVO> listReply(int boardNo);
	
	void saveReply(ReplyVO reply);
	
	void updateReply(ReplyVO reply);
	
	void deleteReply(int rNo); 
	
	
	

}
