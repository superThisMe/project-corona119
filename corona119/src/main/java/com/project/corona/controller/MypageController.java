package com.project.corona.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = {"/mypage"})
public class MypageController {
	
	@GetMapping(path = "/main")
	public String freeboardList() {		
		return "mypage/main";
	}
	

}
