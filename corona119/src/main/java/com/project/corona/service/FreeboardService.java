package com.project.corona.service;

import java.util.List;

import com.project.corona.vo.BoardVO;

public interface FreeboardService {

	List<BoardVO> freeList();

	int freeSave(BoardVO board);

	BoardVO detailFreebd(int boardNo);

	BoardVO updateFreebdV(int boardNo);

	int updateFreebd(BoardVO board);

	void freeDel(int boardNo);

}
