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

	@Override
	public void updateBoard(BoardVO board) {

		volunteerMapper.updateBoard(board);
	}

	@Override
	public void updateVolunteer(VolunteerVO volBoard) {

		volunteerMapper.updateVolunteer(volBoard);
	}

	@Override
	public void deleteImage(int boardNo) {

		volunteerMapper.deleteImage(boardNo);
	}

	@Override
	public void deleteFile(int boardNo) {

		volunteerMapper.deleteFile(boardNo);		
	}

	@Override
	public int countApplyByBoardNo(int boardNo) {

		return volunteerMapper.countApplyByBoardNo(boardNo);
	}

	@Override
	public int findApplyMemberByBoardNo(int boardNo) {
		
		return volunteerMapper.selectApplyMemberByBoardNo(boardNo);
	}

	@Override
	public void deleteApply(HashMap<String, String> hashmap) {
		
		volunteerMapper.deleteApply(hashmap);
	}

	@Override
	public BoardVO findMemberByBoardNo(int boardNo) {

		return volunteerMapper.selectMemberByBoardNo(boardNo);
	}

	@Override
	public ApplyVO findApplyMemberByBoardNoMemberNo(HashMap<String, Object> hashmap) {

		return volunteerMapper.selectMemberByBoardNoMemberNo(hashmap);
	}

	@Override
	public void recoBoard(int boardNo) {

		volunteerMapper.updateRecoByBoardNo(boardNo);
	}

	@Override
	public void nrecoBoard(int boardNo) {
		
		volunteerMapper.updateNrecoByBoardNo(boardNo);
	}

	@Override
	public void singoBoard(int boardNo) {

		volunteerMapper.updateSingoByBoardNo(boardNo);
	}

	@Override
	public int findRecoByBoardNoMemberNo(HashMap<String, Integer> hashmap) {
		
		return volunteerMapper.selectRecoByBoardNoMemberNo(hashmap);
	}

	@Override
	public void insertReco(HashMap<String, Integer> hashmap) {

		volunteerMapper.insertReco(hashmap);
	}

	@Override
	public int findNrecoByBoardNoMemberNo(HashMap<String, Integer> hashmap) {
		
		return volunteerMapper.selectNrecoByBoardNoMemberNo(hashmap);
	}

	@Override
	public void insertNreco(HashMap<String, Integer> hashmap) {

		volunteerMapper.insertNreco(hashmap);
	}

	@Override
	public int findSingoByBoardNoMemberNo(HashMap<String, Integer> hashmap) {
		
		return volunteerMapper.selectSingoByBoardNoMemberNo(hashmap);
	}

	@Override
	public void insertSingo(HashMap<String, Integer> hashmap) {

		volunteerMapper.insertSingo(hashmap);
	}

}
