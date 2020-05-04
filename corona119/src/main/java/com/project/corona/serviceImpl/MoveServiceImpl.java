package com.project.corona.serviceImpl;

import java.util.ArrayList;

import com.project.corona.mapper.MoveMapper;
import com.project.corona.service.MoveService;

import lombok.Setter;

public class MoveServiceImpl implements MoveService{

	@Setter
	private MoveMapper moveMapper;
	
	@Override
	public ArrayList<String> getMoves() {
		
		return moveMapper.selectMoves();
		
	}

}
