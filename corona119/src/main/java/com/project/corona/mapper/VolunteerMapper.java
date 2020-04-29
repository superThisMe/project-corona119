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

}
