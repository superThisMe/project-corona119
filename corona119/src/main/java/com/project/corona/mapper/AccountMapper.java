package com.project.corona.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.MemberVO;

@Mapper
public interface AccountMapper {

	void insertMember(MemberVO member);
	
}
