package com.project.corona.serviceImpl;

import java.util.List;

import com.project.corona.mapper.AdminMapper;
import com.project.corona.service.AdminService;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.MemberVO;
import com.project.corona.vo.NoticeVO;
import com.project.corona.vo.VolunteerVO;

import lombok.Setter;

public class AdminServiceImpl implements AdminService{
	
	@Setter
	private AdminMapper adminMapper;

	@Override
	public List<MemberVO> findAllMember() {

		return adminMapper.selectAllMember();
	}

	@Override
	public void banMemberByMemberNo(Object memberNo) {

		adminMapper.updateMemberByMemberNo(memberNo);
	}

	@Override
	public List<BoardVO> findAllBoard() {

		return adminMapper.selectAllBoard();
	}

	@Override
	public void deleteBoardByBoardNo(Object boardNo) {
		
		adminMapper.updateBoardByBoardNo(boardNo);
	}

	@Override
	public List<VolunteerVO> findAllVolunteer() {
		
		return adminMapper.selectAllVolunteer();
	}

	@Override
	public void confirmVolByBoardNo(Object volNo) {

		adminMapper.updateVolunteerByBoardNo(volNo);
	}

}
