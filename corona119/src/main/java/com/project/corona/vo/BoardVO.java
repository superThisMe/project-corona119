package com.project.corona.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private Date boardRegdate;
	private Boolean boardDeleted;
	private int memberNo;
	private int catNo;
	private int boardReco;
	private int boardNreco;
	private String boardTag;
	private int boardSingo;
	
	private List<VolunteerVO> voluteers;
	private List<BookmarkVO> bookmarks;
	private List<ReplyVO> replies; 
	
}
