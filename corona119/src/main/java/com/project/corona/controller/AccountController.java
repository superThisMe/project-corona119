package com.project.corona.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AccountController {
	
	@GetMapping(value = "/register")
	public String home() {		
		return "register";
	}
	
	@PostMapping(value = "/login")
	public String login() {		
		return "";
	}
	
}
