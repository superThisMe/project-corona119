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
import org.springframework.web.bind.annotation.RequestParam;

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
	public String volBoard(Model model) {
		
		List<BoardVO> volboardList = volunteerService.findVolBoardList();
		
//		System.out.println(volboardList);
		model.addAttribute("volboardList", volboardList);
		
		return "/volunteer/volboard";
	}
	
	@GetMapping(path = "/write")
	public String volWrite(Model model) {
		
		return "/volunteer/volwrite";
	}

	@PostMapping(path = "/write")
	public String volWriteP(String content, String title, String ifilename, HttpSession session) {
		
		MemberVO volMem = (MemberVO) session.getAttribute("loginuser");
		System.out.println("세션 " + volMem);
		System.out.println("보드 " + title + "\n" + content + "\n" + ifilename);
//		memberNo, Nickname 받아옴 / catNo = 1 / parameter에서 title content location duedate wdate1,2 받아옴
		
		//volMem.getMemberNo();
		//volunteerService.writeVolunteer(volMem);
		
		
//		제목 내용 멤노 캣노 볼록 볼마감 볼시작 볼종료
//    	제목 boardTitle 
//		내용 boardContent
//    	활동지역 volLocation
//    	모집기간 volDuedate
//    	활동기간 volWdate
		
		return "redirect:/volunteer/";
	}

	@GetMapping(path = "/detail")
//	public String volDetail(int boardNo, Model model) {
	public String volDetail(Model model) {
		
		//BoardVO volboards = volunteerService.findVolBoardByBoardNo(boardNo);
		
		return "/volunteer/voldetail";
	}
}
