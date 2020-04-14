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
import com.project.corona.vo.MemberVO;

@Controller
@RequestMapping(path = {"/volunteer"})
public class VolunteerController {
	
	@Autowired
	@Qualifier("volunteerService")
	private VolunteerService volunteerService;
	
	@GetMapping(value = {"", "/"})
	public String volunteer() {		
		return "/volunteer/volmain";
	}
	
	@GetMapping(path = "/list")
	public String volBoard(Model model) {
		
		List<BoardVO> volboardList = volunteerService.findVolBoardList();
		
		System.out.println(volboardList);
		model.addAttribute("volboardList", volboardList);
		
		return "/volunteer/volboard";
	}
	
	@GetMapping(path = "/write")
	public String volWrite(Model model) {
		

		
		return "/volunteer/volwrite";
	}
	
	@GetMapping(path = "/detail")
//	public String volDetail(int boardNo, Model model) {
	public String volDetail(Model model) {
		
		//BoardVO volboards = volunteerService.findVolBoardByBoardNo(boardNo);
		
		return "/volunteer/voldetail";
	}
}
