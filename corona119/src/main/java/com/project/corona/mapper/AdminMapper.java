package com.project.corona.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.MemberVO;
import com.project.corona.vo.VolunteerVO;

@Mapper
public interface AdminMapper {

	List<MemberVO> selectAllMember();

	void updateMemberByMemberNo(Object memberNo);

	List<BoardVO> selectAllBoard();

	void updateBoardByBoardNo(Object boardNo);

	List<VolunteerVO> selectAllVolunteer();

	void updateVolunteerByBoardNo(Object volNo);
	
}
