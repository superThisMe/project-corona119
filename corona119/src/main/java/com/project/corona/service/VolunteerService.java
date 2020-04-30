package com.project.corona.service;

import java.util.List;

import com.project.corona.vo.ApplyVO;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.FileVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.VolunteerVO;

public interface VolunteerService {

	List<BoardVO> findBoardList();

	void writeBoard(BoardVO board);
	
	void writeVolunteer(VolunteerVO volunteer);

	BoardVO findBoardListByBoardNo(int boardNo);

	void deleteBoard(int boardNo);

	void writeApply(ApplyVO apply);

	List<ApplyVO> findApplyByBoardNo(int boardNo);

	void uploadImage(ImageVO image);

	void uploadFile(FileVO file);

	List<ImageVO> findImageByBoardNo(int boardNo);
	
	List<FileVO> findFileByBoardNo(int boardNo);

	void updateBoard(BoardVO board);

	void updateVolunteer(VolunteerVO volBoard);

	void deleteImage(int boardNo);
	
	void deleteFile(int boardNo);

}
