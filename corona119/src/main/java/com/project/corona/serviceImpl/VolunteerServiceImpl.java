package com.project.corona.serviceImpl;

import java.util.HashMap;
import java.util.List;

import com.project.corona.mapper.VolunteerMapper;
import com.project.corona.service.VolunteerService;
import com.project.corona.vo.ApplyVO;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.FileVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.VolunteerVO;

import lombok.Setter;

public class VolunteerServiceImpl implements VolunteerService{
	
	@Setter
	private VolunteerMapper volunteerMapper;

	@Override
	public List<BoardVO> findBoardList() {

		return volunteerMapper.selectBoardList();
	}

	@Override
	public void writeBoard(BoardVO board) {
		
		volunteerMapper.insertBoard(board);
	}

	@Override
	public void writeVolunteer(VolunteerVO volunteer) {

		volunteerMapper.insertVolunteer(volunteer);		
	}
	
	@Override
	public BoardVO findBoardListByBoardNo(int boardNo) {

		return volunteerMapper.selectBoardListByBoardNo(boardNo);
	}

	@Override
	public void deleteBoard(int boardNo) {

		volunteerMapper.deleteBoard(boardNo);
	}

	@Override
	public void writeApply(ApplyVO apply) {

		volunteerMapper.insertApply(apply);
		
	}

	@Override
	public List<ApplyVO> findApplyByBoardNo(int boardNo) {

		return volunteerMapper.selectApplyByBoardNo(boardNo);
	}

	@Override
	public void uploadImage(ImageVO image) {

		volunteerMapper.insertImage(image);
	}

	@Override
	public void uploadFile(FileVO file) {
		
		volunteerMapper.insertFile(file);
	}

	@Override
	public List<ImageVO> findImageByBoardNo(int boardNo) {

		return volunteerMapper.selectImageByBoardNo(boardNo);
	}

	@Override
	public List<FileVO> findFileByBoardNo(int boardNo) {

		return volunteerMapper.selectFileByBoardNo(boardNo);
	}

}
