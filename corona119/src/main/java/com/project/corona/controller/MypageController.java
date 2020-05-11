package com.project.corona.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.corona.service.FreeboardService;
import com.project.corona.service.MypageService;
import com.project.corona.vo.BoardVO;

@Controller
@RequestMapping(path = {"/mypage"})
public class MypageController {
	
	@Autowired
	@Qualifier("mypageService")
	private MypageService mypgageService; 
	
	
	@GetMapping(path = "/main")
	public String myBoardList(Model model, int memberNo) {
			
		List<BoardVO> myBoard = mypgageService.myBoard(memberNo);
		model.addAttribute("myBoard", myBoard);
		
		return "mypage/main";
	}
	
	
	

}
