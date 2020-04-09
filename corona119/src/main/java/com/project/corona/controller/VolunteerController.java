package com.project.corona.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = {"/volunteer"})
public class VolunteerController {
	
	@GetMapping(path = "/")
	public String volunteer() {		
		return "/volunteer/volmain";
	}
	
	@GetMapping(path = "/board")
	public String volBoard() {		
		return "/volunteer/volboard";
	}


}
