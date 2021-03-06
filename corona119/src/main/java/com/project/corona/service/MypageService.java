package com.project.corona.service;

import java.util.HashMap;
import java.util.List;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.FileVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.MemberVO;
import com.project.corona.vo.ReplyVO;

public interface MypageService {

	List<BoardVO> myBoard(int memberNo);

	MemberVO myInfo(int memberNo);

	List<BoardVO> myBoardAll(int memberNo);

	List<ReplyVO> myReply(int memberNo);

	List<ReplyVO> myReplyAll(int memberNo);

	

}
