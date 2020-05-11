package com.project.corona.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.ReplyVO;

@Mapper
public interface NanumMapper {

	List<BoardVO> selectAllNanum();

	void insertImage(ImageVO image);

	BoardVO selectNanumByBoardNo(int boardNo);

	List<ReplyVO> selectAllReply(int boardNo);

}
