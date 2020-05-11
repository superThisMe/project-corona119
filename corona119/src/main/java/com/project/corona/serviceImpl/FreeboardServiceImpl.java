package com.project.corona.serviceImpl;

import java.util.HashMap;
import java.util.List;

import com.project.corona.mapper.FreeboardMapper;
import com.project.corona.service.FreeboardService;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.FileVO;
import com.project.corona.vo.ImageVO;
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
	public void freeSave(BoardVO board) {
		
		freeboardMapper.saveFreebd(board);

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

	@Override
	public void uploadImage(ImageVO image) {
		System.out.println(image);
		freeboardMapper.uploadImage(image);
		
	}

	@Override
	public void uploadFile(FileVO file) {
		freeboardMapper.uploadFile(file);
		
	}

	@Override
	public List<ImageVO> findImage(int boardNo) {
	
		return freeboardMapper.findImage(boardNo);
	}

	@Override
	public List<FileVO> findFile(int boardNo) {
		
		return freeboardMapper.findFile(boardNo);
	}

	@Override
	public void delImage(int boardNo) {
		freeboardMapper.delImage(boardNo);		
	}

	@Override
	public void delFile(int boardNo) {
		freeboardMapper.delFile(boardNo);		
	}

	@Override
	public BoardVO recoCount(int boardNo) {
		
		return freeboardMapper.recoCount(boardNo);
	}

	/*///////////////////////////////////////////////ddd */
	
	
	@Override
	public void recoBoard(int boardNo) {

		freeboardMapper.updateRecoByBoardNo(boardNo);
	}

	@Override
	public void nrecoBoard(int boardNo) {
		
		freeboardMapper.updateNrecoByBoardNo(boardNo);
	}

	@Override
	public void singoBoard(int boardNo) {

		freeboardMapper.updateSingoByBoardNo(boardNo);
	}

	@Override
	public int findRecoByBoardNoMemberNo(HashMap<String, Integer> hashmap) {
		
		return freeboardMapper.selectRecoByBoardNoMemberNo(hashmap);
	}

	@Override
	public void insertReco(HashMap<String, Integer> hashmap) {

		freeboardMapper.insertReco(hashmap);
	}

	@Override
	public int findNrecoByBoardNoMemberNo(HashMap<String, Integer> hashmap) {
		
		return freeboardMapper.selectNrecoByBoardNoMemberNo(hashmap);
	}

	@Override
	public void insertNreco(HashMap<String, Integer> hashmap) {

		freeboardMapper.insertNreco(hashmap);
	}

	@Override
	public int findSingoByBoardNoMemberNo(HashMap<String, Integer> hashmap) {
		
		return freeboardMapper.selectSingoByBoardNoMemberNo(hashmap);
	}

	@Override
	public void insertSingo(HashMap<String, Integer> hashmap) {

		freeboardMapper.insertSingo(hashmap);
	}

	@Override
	public List<BoardVO> freeNormal() {
		
		return freeboardMapper.freeNormal();
	}
	
	@Override
	public List<BoardVO> freeSisa() {
		
		return freeboardMapper.freeSisa();
	}




}
