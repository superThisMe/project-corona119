package com.project.corona.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class VolunteerVO {
	
	private int volNo;
	private String volLocation;
	private Boolean volConfirm;
	private Date volDuedate;
	
	private List<ApplyVO> applies;

}
