package com.project.corona.service;

import java.util.List;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.MemberVO;
import com.project.corona.vo.NoticeVO;
import com.project.corona.vo.VolunteerVO;

public interface AdminService {

	List<MemberVO> findAllMember();

	void banMemberByMemberNo(Object memberNo);

	List<BoardVO> findAllBoard();

	void deleteBoardByBoardNo(Object boardNo);

	List<VolunteerVO> findAllVolunteer();

	void confirmVolByBoardNo(Object volNo);

}
