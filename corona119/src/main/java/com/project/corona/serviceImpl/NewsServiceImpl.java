package com.project.corona.serviceImpl;

import java.util.List;

import com.project.corona.mapper.NewsMapper;
import com.project.corona.service.NewsService;
import com.project.corona.vo.BoardVO;

import lombok.Setter;

public class NewsServiceImpl implements NewsService {

	@Setter
	private NewsMapper newsMapper;
	
	@Override
	public List<BoardVO> findNewsList() {
		
		return newsMapper.selectNewsList();
		
	}

	@Override
	public void insertBoard(BoardVO board) {
		
		newsMapper.insertBoard(board);
		
	}
	
	

}
