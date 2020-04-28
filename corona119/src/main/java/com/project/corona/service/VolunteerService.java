package com.project.corona.service;

import java.util.HashMap;
import java.util.List;

import com.project.corona.vo.ApplyVO;
import com.project.corona.vo.BoardVO;

public interface VolunteerService {

	List<BoardVO> findBoardList();

	void writeBoard(HashMap<String, Object> params);

	void writeVolunteer(HashMap<String, Object> params);

	BoardVO findBoardListByBoardNo(int boardNo);

	void deleteBoard(int boardNo);

	void writeApply(ApplyVO apply);

	List<ApplyVO> findApplyByBoardNo(int boardNo);

}
