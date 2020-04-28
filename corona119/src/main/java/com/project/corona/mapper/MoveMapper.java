package com.project.corona.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MoveMapper {

	ArrayList<String> selectMoves();
	
}
