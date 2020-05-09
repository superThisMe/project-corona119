package com.project.corona.service;

import java.util.List;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.ImageVO;

public interface NanumService{

	List<BoardVO> findAllNanum();

	void uploadImage(ImageVO image);

	BoardVO findNanumByBoardNo(int boardNo);

}
