package com.project.corona.service;

import java.util.List;

import com.project.corona.vo.BoardVO;

public interface NewsService {
	
	List<BoardVO> findNewsList();
	void insertBoard(BoardVO board);
}
