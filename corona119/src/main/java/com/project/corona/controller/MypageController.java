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
import com.project.corona.vo.MemberVO;
import com.project.corona.vo.ReplyVO;

@Controller
@RequestMapping(path = {"/mypage"})
public class MypageController {
	
	@Autowired
	@Qualifier("mypageService")
	private MypageService mypgageService; 
	
	
	@GetMapping(path = "/main")
	public String myBoardList(Model model, int memberNo) {
		
		MemberVO myInfo = mypgageService.myInfo(memberNo);
		model.addAttribute("myInfo", myInfo);
		
		List<BoardVO> myBoard = mypgageService.myBoard(memberNo);
		model.addAttribute("myBoard", myBoard);
		
		List<ReplyVO> myReply = mypgageService.myReply(memberNo);
		model.addAttribute("myReply", myReply);
		
		return "mypage/main";
	}
	
	@GetMapping(path = "/myBoardAll")
	public String myBoardListAll(Model model, int memberNo) {
					
		List<BoardVO> myBoard = mypgageService.myBoardAll(memberNo);
		model.addAttribute("myBoard", myBoard);
				
		return "mypage/myboard";
	}
	
	@GetMapping(path = "/myReplyAll")
	public String myReplyListAll(Model model, int memberNo) {
					
		List<ReplyVO> myReplyAll = mypgageService.myReplyAll(memberNo);
		model.addAttribute("myReplyAll", myReplyAll);
				
		return "mypage/myreply";
	}
	
	

}
