package com.project.corona.serviceImpl;

import com.project.corona.mapper.AccountMapper;
import com.project.corona.service.AccountService;
import com.project.corona.vo.MemberVO;

import lombok.Setter;

public class AccountServiceImpl implements AccountService{
	
	@Setter
	private AccountMapper accountMapper;

	@Override
	public void registMember(MemberVO member) {

		accountMapper.insertMember(member);
		
	}

	@Override
	public String idCheck(String memberId) {

		return accountMapper.selectMemberId(memberId);
	}

	@Override
	public String emailCheck(String memberEmail) {

		return accountMapper.selectMemberEmail(memberEmail);
	}

	@Override
	public String nickCheck(String memberNick) {

		return accountMapper.selectMemberNick(memberNick);
	}

	@Override
	public void memberDel(int memberNo) {
		accountMapper.deleteMember(memberNo);
		
	}

	@Override
	public void updateRegist(MemberVO member) {
		accountMapper.updateRegist(member);
		
	}

}
