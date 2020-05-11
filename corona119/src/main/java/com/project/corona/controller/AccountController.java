package com.project.corona.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.corona.common.Sha256;
import com.project.corona.service.AccountService;
import com.project.corona.service.MemberService;
import com.project.corona.vo.MemberVO;

@Controller
public class AccountController {

	@Autowired
	@Qualifier("accountService")
	private AccountService accountService;
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@PostMapping(path = {"/account/signup"})
	public String signUp(MemberVO member) {
		String encryPassword = Sha256.encrypt(member.getMemberPsw());
		member.setMemberPsw(encryPassword);

		accountService.registMember(member);
		
		return "redirect:/";
	}
	
	@PostMapping(value = "/login")
	public String login(MemberVO member, HttpServletRequest request, HttpSession session) {		
		String encryPassword = Sha256.encrypt(member.getMemberPsw());
		member.setMemberPsw(encryPassword);
		
		MemberVO member2 = memberService.findMemberByIdAndPasswd(member);
		//System.out.println(member2);
		if (member2 == null) {
			return "redirect:/";
		} else {
		    String referrer = request.getHeader("Referer");
		    int idx = referrer.indexOf("corona");
		    
			session.setAttribute("loginuser", member2);
			return "redirect:/" + referrer.substring(idx + 7);
		}
		
	}
	
	@GetMapping(path = { "/logout" })
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		return "redirect:/";
	}
	
	
	@PostMapping(path = {"/check/id"})
	@ResponseBody
	public String checkId(String memberId) {
		return accountService.idCheck(memberId);
	}
	
	@PostMapping(path = {"/check/email"})
	@ResponseBody
	public String checkEmail(String memberEmail) {
		return accountService.emailCheck(memberEmail);
	}
	
	@PostMapping(path = {"/check/nick"})
	@ResponseBody
	public String checkNick(String memberNick) {
		return accountService.nickCheck(memberNick);
	}
	
	@GetMapping(path = "/account/memberDel")
	public String memberDel( int memberNo, HttpSession session) {
		accountService.memberDel(memberNo);
		session.removeAttribute("loginuser");
		return "redirect:/";
	}
	
	@PostMapping(path = {"/account/upReg"})
	public String upReg(MemberVO member) {
		String encryPassword = Sha256.encrypt(member.getMemberPsw());
		member.setMemberPsw(encryPassword);

		accountService.updateRegist(member);
		
		return "redirect:/";
	}
	
}