package com.project.corona.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.BoardVO;

@Mapper
public interface NewsMapper {

	List<BoardVO> selectNewsList();
	void insertBoard(BoardVO board);
	BoardVO selectBoardByBno(int bno);
}
