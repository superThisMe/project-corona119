package com.project.corona.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.corona.service.VolunteerService;
import com.project.corona.vo.BoardVO;

@Controller
@RequestMapping(path = {"/volunteer"})
public class VolunteerController {
	
	@Autowired
	@Qualifier("volunteerService")
	private VolunteerService volunteerService;
	
	@GetMapping(path = "/")
	public String volunteer() {		
		return "/volunteer/volmain";
	}
	
	@GetMapping(path = "/board")
	public String volBoard(Model model) {
		
		List<BoardVO> volboardList = volunteerService.findVolBoardList();
		
		System.out.println(volboardList);
		
		model.addAttribute("volboardList", volboardList);
		
		return "/volunteer/volboard";
	}


}
