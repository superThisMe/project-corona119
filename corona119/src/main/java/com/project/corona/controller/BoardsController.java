package com.project.corona.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = {"/boards"})
public class BoardsController {
	
	@GetMapping(path = "/freeboard")
	public String freeboardList() {		
		return "boards/freeboard";
	}
	

}
