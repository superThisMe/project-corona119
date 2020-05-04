package com.project.corona.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.corona.common.KakaoRestApiHelper;
import com.project.corona.service.MoveService;

@Controller
public class MoveController {
	
	@Autowired
	@Qualifier("moveService")
	private MoveService moveService;
	
	@GetMapping(value = "/move")
	public String move(Model model) {
		
		ArrayList<String> moves = moveService.getMoves();
		
		model.addAttribute("moves", moves);
		
		KakaoRestApiHelper kakao = new KakaoRestApiHelper();
		
		try {
			ArrayList<String> latLngs = (ArrayList<String>) kakao.searchPlaceByAddr(moves);
			
			model.addAttribute("latLngs", latLngs);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return "move";
	}
	
}
