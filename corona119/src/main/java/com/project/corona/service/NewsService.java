package com.project.corona.service;

import java.util.List;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.NewsVO;

public interface NewsService {
	
	List<NewsVO> findNewsList();
//	int insertBoard(BoardVO board);
	NewsVO findBoardByBno(int bno);
}
