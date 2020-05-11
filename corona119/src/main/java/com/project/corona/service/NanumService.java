package com.project.corona.service;

import java.util.List;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.ReplyVO;

public interface NanumService{

	List<BoardVO> findAllNanum();

	void uploadImage(ImageVO image);

	BoardVO findNanumByBoardNo(int boardNo);

	List<ReplyVO> findAllReply(int boardNo);

}
