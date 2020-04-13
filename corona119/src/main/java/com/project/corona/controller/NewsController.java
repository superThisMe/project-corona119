package com.project.corona.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.corona.service.NewsService;

@Controller
@RequestMapping(path = { "/news" })
public class NewsController {
	
//	@Autowired
//	@Qualifier("newsService")
//	private NewsService newsService;
	
	@GetMapping(path = { "/list" })
	public String newsList() {
		return "news/list";
	}
	
	@GetMapping(path = { "/write" })
	public String showWriteForm() {
		return "news/write";
	}

}
