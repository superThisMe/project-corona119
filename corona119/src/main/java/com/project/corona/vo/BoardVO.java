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
	
	private VolunteerVO volunteers;
	private List<BookmarkVO> bookmarks;
	private List<ReplyVO> replies;
	private MemberVO member;
	
	private List<ImageVO> image;
	private List<FileVO> file;
	private CategoryVO category;
	
}
