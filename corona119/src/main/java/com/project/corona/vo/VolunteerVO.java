package com.project.corona.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class VolunteerVO {
	
	private int volNo;
	private String volLocation;
	private Boolean volConfirm;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date volDuedate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date volWdate1;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date volWdate2;
	
	private List<ApplyVO> applies;

}
