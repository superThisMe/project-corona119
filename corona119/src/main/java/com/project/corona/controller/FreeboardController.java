package com.project.corona.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.corona.service.FreeboardService;
import com.project.corona.vo.BoardVO;

@Controller
@RequestMapping(path = { "/freeboard" })
public class FreeboardController {
	
	@Autowired
	@Qualifier("freeboardService")
	private FreeboardService freeboardService; 
	
	@GetMapping(path = "/free-list")
	public String freeList(Model model) {
		
		List<BoardVO> freeList = freeboardService.freeList();
		model.addAttribute("freeList", freeList);
		
		return "/freeboard/free-list";
	}
	
	@GetMapping(path= {"/free-write"})
	public String freeboardWrite() {
		return "/freeboard/free-write";
	}
	
	@PostMapping(path= {"/freeSave"} )
	public String saveFreeboard(BoardVO board, RedirectAttributes attr) {
		
		int newFreeboard = freeboardService.freeSave(board);
		
		attr.addFlashAttribute("boardNo", newFreeboard);
		
		return "redirect:free-list";
	}
	
	@GetMapping(path= {"/freeDetail"})
	public String detailFreebd(Model model, int boardNo, HttpServletRequest req, HttpServletResponse resp) {
		
		BoardVO board = freeboardService.detailFreebd(boardNo);
		if (board == null) {
			return "redirect:free-list";
		}
		
		String boardRead = "";
		Cookie[] cookies = req.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("readBoard")) {
				boardRead = cookie.getValue();
			}
		}
		
		if(!boardRead.contains(String.format("[%d]", boardNo))){
			freeboardService.changeCount(boardNo);
			board.setBoardCount(board.getBoardCount() + 1);
		
			Cookie newCookie = new Cookie("readBoard", String.format("%s[%d]", boardRead, boardNo));
			resp.addCookie(newCookie);
		}
				
		model.addAttribute("board", board);
			
	return "/freeboard/free-detail";

	}
	
	@GetMapping(path= {"/freeUpdate"})
	public String updateFreebdView(Model model, int boardNo) {
		
		BoardVO board = freeboardService.updateFreebdV(boardNo);
		
		model.addAttribute("board", board);
			
		return "/freeboard/free-update";
	}
	
	@PostMapping(path= {"/freeUpdate"})
	public String updateFreebd(BoardVO board, RedirectAttributes attr) {
		
		int updateFreebd = freeboardService.updateFreebd(board);
		
		attr.addFlashAttribute("boardNo", updateFreebd);
		
		return "redirect:free-list";
	}
	
	@GetMapping(path= {"/freeDel"})
	public String delFreebd(int boardNo) {
		
		freeboardService.freeDel(boardNo);
				
		return "redirect:free-list";
	}
	

}