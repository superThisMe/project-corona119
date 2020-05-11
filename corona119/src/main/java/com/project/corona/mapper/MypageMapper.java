package com.project.corona.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.FileVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.MemberVO;
import com.project.corona.vo.ReplyVO;

@Mapper
public interface MypageMapper {

	List<BoardVO> myBoard(int memberNo);

	MemberVO myInfo(int memberNo);

	List<BoardVO> myBoardAll(int memberNo);

	List<ReplyVO> myReply(int memberNo);

	List<ReplyVO> myReplyAll(int memberNo);
	
	

}
