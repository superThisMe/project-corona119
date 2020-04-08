package com.project.corona.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeRegDate;
	private int noticeCount;
	private String noticeWriter;
	private Boolean noticeDeleted;
	private int memberNo;
	
}
