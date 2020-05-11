package com.project.corona.serviceImpl;

import java.util.HashMap;
import java.util.List;

import com.project.corona.mapper.FreeboardMapper;
import com.project.corona.mapper.MypageMapper;
import com.project.corona.service.FreeboardService;
import com.project.corona.service.MypageService;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.FileVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.ReplyVO;

import lombok.Setter;

public class MypageServiceImpl implements MypageService{
	
	@Setter
	private MypageMapper mypageMapper;

	@Override
	public List<BoardVO> myBoard(int memberNo) {
		
		return mypageMapper.myBoard(memberNo);
	}

	
}
