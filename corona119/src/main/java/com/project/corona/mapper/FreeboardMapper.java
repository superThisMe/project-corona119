package com.project.corona.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.FileVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.ReplyVO;

@Mapper
public interface FreeboardMapper {

	List<BoardVO> freeList();

	void saveFreebd(BoardVO board);

	BoardVO detailFreebd(int boardNo);

	BoardVO updateFreebdV(int boardNo);

	void updateFreebd(BoardVO board);

	void freeDel(int boardNo);

	boolean changeCount(int boardNo);

	void uploadImage(ImageVO image);

	void uploadFile(FileVO file);

	List<ImageVO> findImage(int boardNo);

	List<FileVO> findFile(int boardNo);

	void delImage(int boardNo);

	void delFile(int boardNo);
	
	

}
