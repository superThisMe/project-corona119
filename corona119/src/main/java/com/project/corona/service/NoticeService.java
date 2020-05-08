package com.project.corona.service;

import java.util.List;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.NoticeVO;

public interface NoticeService{

//	List<NoticeVO> findNoticeList();

	List<BoardVO> findAllNotice();
	
}
