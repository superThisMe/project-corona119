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

}
