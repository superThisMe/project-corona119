package com.project.corona.service;

import java.util.HashMap;
import java.util.List;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.ReplyVO;

public interface NanumService{

	List<BoardVO> findAllNanum();

	void uploadImage(ImageVO image);

	BoardVO findNanumByBoardNo(int boardNo);

	List<ReplyVO> findAllReply(int boardNo);

	void writeReplyByBoardNo(ReplyVO reply);

	String findReplyByBoardNoMemberNo(HashMap<String, Object> hashmap);

	List<String> findReplyMemByBoardNo(int boardNo);

	String findMemberByMemberNo(String get);

	void exireBoardRegDate(int boardNo);

	void updateResult(HashMap<String, String> hashmap);

}
