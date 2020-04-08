package com.project.corona.mapper;

import com.project.corona.vo.MemberVO;

public interface MemberMapper {

	MemberVO selectMemberByIdAndPasswd(MemberVO member);

}
