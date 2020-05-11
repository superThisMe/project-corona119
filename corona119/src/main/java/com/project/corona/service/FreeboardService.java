package com.project.corona.service;

import java.util.HashMap;
import java.util.List;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.FileVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.ReplyVO;

public interface FreeboardService {

	List<BoardVO> freeList();

	void freeSave(BoardVO board);

	BoardVO detailFreebd(int boardNo);

	BoardVO updateFreebdV(int boardNo);

	int updateFreebd(BoardVO board);

	void freeDel(int boardNo);
	
	public boolean changeCount(int boardNo);

	void uploadImage(ImageVO image);

	void uploadFile(FileVO file);

	List<ImageVO> findImage(int boardNo);

	List<FileVO> findFile(int boardNo);

	void delImage(int boardNo);

	void delFile(int boardNo);

	BoardVO recoCount(int boardNo);
	
	/*////////////////////////////// */
	
	void recoBoard(int boardNo);

	void nrecoBoard(int boardNo);
	
	void singoBoard(int boardNo);

	int findRecoByBoardNoMemberNo(HashMap<String, Integer> hashmap);

	void insertReco(HashMap<String, Integer> hashmap);

	int findNrecoByBoardNoMemberNo(HashMap<String, Integer> hashmap);

	void insertNreco(HashMap<String, Integer> hashmap);

	int findSingoByBoardNoMemberNo(HashMap<String, Integer> hashmap);

	void insertSingo(HashMap<String, Integer> hashmap);

	List<BoardVO> freeNormal();
	
	List<BoardVO> freeSisa();


}
