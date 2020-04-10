package com.project.corona.serviceImpl;

import java.util.List;

import com.project.corona.mapper.VolunteerMapper;
import com.project.corona.service.VolunteerService;
import com.project.corona.vo.BoardVO;

import lombok.Setter;

public class VolunteerServiceImpl implements VolunteerService{
	
	@Setter
	private VolunteerMapper volunteerMapper;

	@Override
	public List<BoardVO> findVolBoardList() {

		return volunteerMapper.selectVolBoardList();
	}

}
