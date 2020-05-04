package com.project.corona.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MaskController {
	
	@GetMapping(value = "/mask")
	public String mask(Model model) {
		
		return "mask";
	}
	
}
