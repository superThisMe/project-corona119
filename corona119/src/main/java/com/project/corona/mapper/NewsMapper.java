package com.project.corona.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.NewsVO;

@Mapper
public interface NewsMapper {

	List<NewsVO> selectNewsList();
//	void insertBoard(BoardVO board);
	NewsVO selectBoardByBno(int bno);
}
