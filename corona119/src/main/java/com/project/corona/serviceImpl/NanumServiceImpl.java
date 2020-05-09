package com.project.corona.serviceImpl;

import java.util.List;

import com.project.corona.mapper.NanumMapper;
import com.project.corona.service.NanumService;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.ImageVO;

import lombok.Setter;

public class NanumServiceImpl implements NanumService{
	
	@Setter
	private NanumMapper nanumMapper;

	@Override
	public List<BoardVO> findAllNanum() {

		return nanumMapper.selectAllNanum();
	}

	@Override
	public void uploadImage(ImageVO image) {
		
		nanumMapper.insertImage(image);
	}

	@Override
	public BoardVO findNanumByBoardNo(int boardNo) {

		return nanumMapper.selectNanumByBoardNo(boardNo);
	}

}
