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

import com.project.corona.service.NewsService;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.MemberVO;

@Controller
@RequestMapping(path = { "/news" })
public class NewsController {
	
	@Autowired
	@Qualifier("newsService")
	private NewsService newsService;
	
	@GetMapping(path = { "/list" })
	public String newsList(Model model) {
		
		List<BoardVO> newsList = newsService.findNewsList();
		System.out.println(newsList);
		model.addAttribute("newsList", newsList);
		
		return "news/list";
	}
	
	@GetMapping(path = { "/write" })
	public String showWriteForm() {
		
		return "news/write";
	}
	
	@PostMapping(path = { "/write" })
	public String newsWrite(BoardVO board, HttpSession session) {
		
		MemberVO member = (MemberVO) session.getAttribute("loginuser");
		System.out.println(member);
		
		board.setCatNo(0);
		board.setMemberNo(member.getMemberNo());
		
		newsService.insertBoard(board);
		
		return "redirect:/news/list";
	}

}
