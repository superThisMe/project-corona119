package com.project.corona.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.corona.service.VolunteerService;
import com.project.corona.vo.ApplyVO;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.MemberVO;
import com.project.corona.vo.VolunteerVO;

@Controller
@RequestMapping(path = {"/volunteer"})
public class VolunteerController {
	
	@Autowired
	@Qualifier("volunteerService")
	private VolunteerService volunteerService;
	
	@GetMapping(value = {"", "/"})
	public String volBoard(Model model) {
		
		List<BoardVO> volboardList = volunteerService.findBoardList();
		
//		System.out.println(volboardList);
		model.addAttribute("volboardList", volboardList);
		
		return "/volunteer/volboard";
	}
	
	@GetMapping(path = "/write")
	public String volWrite(Model model) {
		
		return "/volunteer/volwrite";
	}

	@PostMapping(path = "/write")
	public String volWriteP(BoardVO board, VolunteerVO volBoard, HttpSession session) {
		
		MemberVO volMem = (MemberVO) session.getAttribute("loginuser");
		
		board.setCatNo(1);
		board.setVolunteers(volBoard);
		HashMap<String, Object> params = new HashMap<>();
		params.put("memberNo", volMem.getMemberNo());
		params.put("board", board);
		
		volunteerService.writeBoard(params);
		volunteerService.writeVolunteer(params);
		
		return "redirect:/volunteer/";
	}

	@GetMapping(path = { "/detail/{boardNo}" })
	public String volDetail(@PathVariable("boardNo") int boardNo, Model model) {
		
		BoardVO volboardDetail = volunteerService.findBoardListByBoardNo(boardNo);
		if (volboardDetail == null) {
			return "redirect:/volunteer/";
		}		
		model.addAttribute("vDetail", volboardDetail);
		
		return "/volunteer/voldetail";
	}
	
	@GetMapping(path = { "/delete/{boardNo}" })
	public String volDelete(@PathVariable("boardNo") int boardNo) {
		
		volunteerService.deleteBoard(boardNo);
		
		return "redirect:/volunteer/";
	}
	
	@GetMapping(path = { "/apply/{boardNo}" })
	public String volApply(@PathVariable("boardNo") int boardNo, Model model) {

		List<ApplyVO> applyList = volunteerService.findApplyByBoardNo(boardNo);
		System.out.println(applyList);
		model.addAttribute("applyList", applyList);
		return "/volunteer/apply/apply";
	}
	
	@PostMapping(path = {"/apply/write/{boardNo}"})
	@ResponseBody
	public void writeRe(@PathVariable("boardNo") int boardNo, ApplyVO apply, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginuser");
		apply.setMemberNo(member.getMemberNo());
		apply.setVolNo(boardNo);
		
		volunteerService.writeApply(apply);

	}
}
