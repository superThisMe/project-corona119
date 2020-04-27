package com.project.corona.serviceImpl;

import java.util.HashMap;
import java.util.List;

import com.project.corona.mapper.VolunteerMapper;
import com.project.corona.service.VolunteerService;
import com.project.corona.vo.ApplyVO;
import com.project.corona.vo.BoardVO;

import lombok.Setter;

public class VolunteerServiceImpl implements VolunteerService{
	
	@Setter
	private VolunteerMapper volunteerMapper;

	@Override
	public List<BoardVO> findBoardList() {

		return volunteerMapper.selectBoardList();
	}

	@Override
	public void writeBoard(HashMap<String, Object> params) {
		
		volunteerMapper.insertBoard(params);
	}

	@Override
	public void writeVolunteer(HashMap<String, Object> params) {

		volunteerMapper.insertVolunteer(params);		
	}

	@Override
	public BoardVO findBoardListByBoardNo(int boardNo) {

		return volunteerMapper.selectBoardListByBoardNo(boardNo);
	}

	@Override
	public void deleteBoard(int boardNo) {

		volunteerMapper.deleteBoard(boardNo);
	}

	@Override
	public void writeApply(ApplyVO apply) {

		volunteerMapper.insertApply(apply);
		
	}

	@Override
	public List<ApplyVO> findApplyByBoardNo(int boardNo) {

		return volunteerMapper.selectApplyByBoardNo(boardNo);
	}

}
