package com.project.corona.serviceImpl;

import com.project.corona.mapper.MemberMapper;
import com.project.corona.service.MemberService;
import com.project.corona.vo.MemberVO;

import lombok.Setter;

public class MemberServiceImpl implements MemberService {
	
	@Setter
	private MemberMapper memberMapper;

	@Override
	public MemberVO findMemberByIdAndPasswd(MemberVO member) {
		
		return memberMapper.selectMemberByIdAndPasswd(member);
	}
	
	

}
