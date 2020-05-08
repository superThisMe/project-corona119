package com.project.corona.serviceImpl;

import java.util.List;

import com.project.corona.mapper.NoticeMapper;
import com.project.corona.service.NoticeService;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.NoticeVO;

import lombok.Setter;

public class NoticeServiceImpl implements NoticeService{
	
	@Setter
	private NoticeMapper noticeMapper;

//	@Override
//	public List<NoticeVO> findNoticeList() {
//		return noticeMapper.selectNoticeList();
//	}

	@Override
	public List<BoardVO> findAllNotice() {

		return noticeMapper.selectAllNotice();
	}
	
	

}
