package com.project.corona.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoteVO {
	
	private int noteNo;
	private String noteContent;
	private Date noteDate;
	private Boolean noteCheck;
	private int noteSender;
	private int noteReceiver;
	
}
