package com.project.corona.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.ReplyVO;

@Mapper
public interface FreeboardMapper {

	List<BoardVO> freeList();

	void saveFreebd(BoardVO board);

	BoardVO detailFreebd(int boardNo);

	BoardVO updateFreebdV(int boardNo);

	void updateFreebd(BoardVO board);

	void freeDel(int boardNo);
	
	

}
