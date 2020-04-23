package com.project.corona.service;

import java.util.HashMap;
import java.util.List;

import com.project.corona.vo.BoardVO;

public interface VolunteerService {

	List<BoardVO> findBoardList();

	void writeBoard(HashMap<String, Object> params);

	void writeVolunteer(HashMap<String, Object> params);

	BoardVO findBoardListByBoardNo(int boardNo);

	void deleteBoard(int boardNo);

}
