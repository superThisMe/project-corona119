package com.project.corona.serviceImpl;

import java.util.HashMap;
import java.util.List;

import com.project.corona.mapper.NanumMapper;
import com.project.corona.service.NanumService;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.ReplyVO;

import lombok.Setter;

public class NanumServiceImpl implements NanumService{
	
	@Setter
	private NanumMapper nanumMapper;

	@Override
	public List<BoardVO> findAllNanum() {

		return nanumMapper.selectAllNanum();
	}

	@Override
	public void uploadImage(ImageVO image) {
		
		nanumMapper.insertImage(image);
	}

	@Override
	public BoardVO findNanumByBoardNo(int boardNo) {

		return nanumMapper.selectNanumByBoardNo(boardNo);
	}

	@Override
	public List<ReplyVO> findAllReply(int boardNo) {

		return nanumMapper.selectAllReply(boardNo);
	}

	@Override
	public void writeReplyByBoardNo(ReplyVO reply) {

		nanumMapper.insertReplyByBoardNo(reply);
	}

	@Override
	public String findReplyByBoardNoMemberNo(HashMap<String, Object> hashmap) {

		return nanumMapper.selectReplyByBoardNoMemberNo(hashmap);
	}

	@Override
	public List<String> findReplyMemByBoardNo(int boardNo) {

		return nanumMapper.selectReplyMemByBoardNo(boardNo);
	}

	@Override
	public String findMemberByMemberNo(String get) {

		return nanumMapper.selectMemberByMemberNo(get);
	}

	@Override
	public void exireBoardRegDate(int boardNo) {

		nanumMapper.exireBoardRegDate(boardNo);
	}

	@Override
	public void updateResult(HashMap<String, String> hashmap) {

		nanumMapper.updateResult(hashmap);
	}

}
