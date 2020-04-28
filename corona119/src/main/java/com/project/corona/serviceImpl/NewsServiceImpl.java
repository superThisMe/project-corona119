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
	public int insertBoard(BoardVO board) {
		
		newsMapper.insertBoard(board);
		return board.getBoardNo();		
	}

	@Override
	public BoardVO findBoardByBno(int bno) {
		
		return newsMapper.selectBoardByBno(bno);
	}
	
	

}
