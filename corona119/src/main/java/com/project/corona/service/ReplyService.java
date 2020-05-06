package com.project.corona.service;

import java.util.List;

import com.project.corona.vo.ReplyVO;

public interface ReplyService {

	List<ReplyVO> listReply(int boardNo);

	void saveReply(ReplyVO reply);

	void updateReply(ReplyVO reply);

	void deleteReply(int rNo);

}
