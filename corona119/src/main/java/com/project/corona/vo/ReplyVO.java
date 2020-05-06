package com.project.corona.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int rNo;
	private String reply;
	private String replyer;
	private Date replyDate;
	private Boolean replyDeleted;
	private int gNo;
	private int sNo;
	private int boardNo;
	private int memberNo;
	
	private MemberVO member;
	private BoardVO board;

}
