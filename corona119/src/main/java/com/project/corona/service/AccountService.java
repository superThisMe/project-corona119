package com.project.corona.service;

import com.project.corona.vo.MemberVO;

public interface AccountService {

	void registMember(MemberVO member);

	String idCheck(String memberId);

	String emailCheck(String memberEmail);
	
	String nickCheck(String memberNick);

}
