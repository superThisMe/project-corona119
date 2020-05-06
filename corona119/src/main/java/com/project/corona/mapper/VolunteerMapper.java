package com.project.corona.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.ApplyVO;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.FileVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.VolunteerVO;

@Mapper
public interface VolunteerMapper {

	List<BoardVO> selectBoardList();

	void insertBoard(BoardVO board);

	void insertVolunteer(VolunteerVO volunteer);

	BoardVO selectBoardListByBoardNo(int boardNo);

	void deleteBoard(int boardNo);

	void insertApply(ApplyVO apply);

	List<ApplyVO> selectApplyByBoardNo(int boardNo);

	void insertImage(ImageVO image);

	void insertFile(FileVO file);

	List<ImageVO> selectImageByBoardNo(int boardNo);
	
	List<FileVO> selectFileByBoardNo(int boardNo);

	void updateBoard(BoardVO board);

	void updateVolunteer(VolunteerVO volBoard);

	void deleteImage(int boardNo);

	void deleteFile(int boardNo);

	int countApplyByBoardNo(int boardNo);

	int selectApplyMemberByBoardNo(int boardNo);

	void deleteApply(HashMap<String, String> hashmap);

	BoardVO selectMemberByBoardNo(int boardNo);

	ApplyVO selectMemberByBoardNoMemberNo(HashMap<String, Object> hashmap);

	void updateRecoByBoardNo(int boardNo);
	
	void updateNrecoByBoardNo(int boardNo);
	
	void updateSingoByBoardNo(int boardNo);

	int selectRecoByBoardNoMemberNo(HashMap<String, Integer> hashmap);

	void insertReco(HashMap<String, Integer> hashmap);

	int selectNrecoByBoardNoMemberNo(HashMap<String, Integer> hashmap);

	void insertNreco(HashMap<String, Integer> hashmap);

	int selectSingoByBoardNoMemberNo(HashMap<String, Integer> hashmap);

	void insertSingo(HashMap<String, Integer> hashmap);
	
}
