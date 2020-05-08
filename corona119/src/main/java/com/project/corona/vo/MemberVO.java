package com.project.corona.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private int memberNo;
	private String memberId;
	private String memberPsw;
	private String memberEmail;
	private Date memberRegdate;
	private String memberType;
	private Boolean memberDeleted;
	private String memberAddr;
	private String memberAddrDetail;
	private String memberName;
	private String memberNickname;
	private int memberPoint;
	
	private List<NoteVO> notes;
	private List<BoardVO> boards;
	private List<ApplyVO> applies;
	private List<BookmarkVO> bookmarks;
	private List<ReplyVO> replies;

}
