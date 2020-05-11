package com.project.corona.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.MemberVO;

@Mapper
public interface AccountMapper {

	void insertMember(MemberVO member);

	String selectMemberId(String memberId);

	String selectMemberEmail(String memberEmail);
	
	String selectMemberNick(String memberNick);

	void deleteMember(int memberNo);
	
}
