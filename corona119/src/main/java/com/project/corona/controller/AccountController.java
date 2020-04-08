package com.project.corona.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.corona.service.MemberService;
import com.project.corona.vo.MemberVO;

@Controller
public class AccountController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@GetMapping(value = "/register")
	public String home() {		
		return "register";
	}
	
	@PostMapping(value = "/login")
	public String login(MemberVO member, HttpSession session) {		
		
		MemberVO member2 = memberService.findMemberByIdAndPasswd(member);
		if (member2 == null) {
			return "redirect:/";
		} else {
			session.setAttribute("loginuser", member2);
			return "redirect:/";
		}
		
	}
	
	@GetMapping(path = { "/logout" })
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		return "redirect:/";
	}
	
}