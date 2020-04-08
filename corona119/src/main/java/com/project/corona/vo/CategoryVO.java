package com.project.corona.vo;

import java.util.List;

import lombok.Data;

@Data
public class CategoryVO {
	
	private int catNo;
	private String category;
	
	private List<BoardVO> boards;
}
