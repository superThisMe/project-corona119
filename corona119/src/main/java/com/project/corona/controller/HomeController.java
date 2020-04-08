package com.project.corona.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.corona.service.NoticeService;
import com.project.corona.vo.NoticeVO;

@Controller
public class HomeController {
	
	@Autowired
	@Qualifier("noticeService")
	private NoticeService noticeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<NoticeVO> notice = noticeService.findNoticeList();
		
		model.addAttribute("notice", notice);
		
		return "index";
	}
	
}
