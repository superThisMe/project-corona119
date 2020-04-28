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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		model.addAttribute("newsList", newsList);
		
		return "news/list";
	}
	
	@GetMapping(path = { "/write" })
	public String showWriteForm() {
		
		return "news/write";
	}
	
	@PostMapping(path = { "/write" })
	public String newsWrite(BoardVO board, RedirectAttributes attr) {
		
		int boardNo = newsService.insertBoard(board);
		attr.addAttribute("boardNo", boardNo);
		
		return "redirect:/news/list";
	}
	
	@GetMapping(path = { "/detail" })
	public String newsDetail(Model model, int bno) {
		
		BoardVO newsDetail = newsService.findBoardByBno(bno);
		if (newsDetail == null) {
			return "redirect:/news/list";
		}
		
		model.addAttribute("newsDetail", newsDetail);
		
		return "news/detail";
	}

}
