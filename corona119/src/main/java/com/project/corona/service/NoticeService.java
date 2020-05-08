package com.project.corona.service;

import java.util.List;

import com.project.corona.vo.BoardVO;

public interface NoticeService{

//	List<NoticeVO> findNoticeList();

	List<BoardVO> findAllNotice();

	BoardVO findNoticeByBoardNo(int boardNo);
	
}
