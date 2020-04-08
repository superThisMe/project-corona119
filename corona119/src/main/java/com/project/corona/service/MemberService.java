package com.project.corona.service;

import com.project.corona.vo.MemberVO;

public interface MemberService {
		
	MemberVO findMemberByIdAndPasswd(MemberVO member);

}
