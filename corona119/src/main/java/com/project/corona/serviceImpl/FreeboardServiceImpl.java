package com.project.corona.serviceImpl;

import java.util.List;

import com.project.corona.mapper.FreeboardMapper;
import com.project.corona.service.FreeboardService;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.ReplyVO;

import lombok.Setter;

public class FreeboardServiceImpl implements FreeboardService{
	
	@Setter
	private FreeboardMapper freeboardMapper;

	@Override
	public List<BoardVO> freeList() {
		
		return freeboardMapper.freeList();
	}

	@Override
	public int freeSave(BoardVO board) {
		
		freeboardMapper.saveFreebd(board);
		
		return board.getBoardNo();
	}

	@Override
	public BoardVO detailFreebd(int boardNo) {
		
		return freeboardMapper.detailFreebd(boardNo);
	}

	@Override
	public BoardVO updateFreebdV(int boardNo) {
		
		return freeboardMapper.updateFreebdV(boardNo);
	}

	@Override
	public int updateFreebd(BoardVO board) {
		
		freeboardMapper.updateFreebd(board);
		
		return board.getBoardNo();
	}

	@Override
	public void freeDel(int boardNo) {
		
		freeboardMapper.freeDel(boardNo);
		
	}

	@Override
	public boolean changeCount(int boardNo) {
		
		return freeboardMapper.changeCount(boardNo);
	}


}
