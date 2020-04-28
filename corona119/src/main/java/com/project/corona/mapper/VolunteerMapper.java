package com.project.corona.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.ApplyVO;
import com.project.corona.vo.BoardVO;

@Mapper
public interface VolunteerMapper {

	List<BoardVO> selectBoardList();

	void insertBoard(HashMap<String, Object> params);

	void insertVolunteer(HashMap<String, Object> params);

	BoardVO selectBoardListByBoardNo(int boardNo);

	void deleteBoard(int boardNo);

	void insertApply(ApplyVO apply);

	List<ApplyVO> selectApplyByBoardNo(int boardNo);

}
