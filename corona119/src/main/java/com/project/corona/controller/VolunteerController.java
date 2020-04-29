package com.project.corona.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.corona.service.VolunteerService;
import com.project.corona.vo.ApplyVO;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.FileVO;
import com.project.corona.vo.ImageVO;
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
	public String volWriteP(BoardVO board, VolunteerVO volBoard, ImageVO image, FileVO file, HttpSession session) {
		
		if(session == null) {
			return "redirect:/volunteer/";
		}
		MemberVO volMem = (MemberVO) session.getAttribute("loginuser");
		board.setMemberNo(volMem.getMemberNo());
		board.setVolunteers(volBoard);
		
		volunteerService.writeBoard(board);
		int boardNo = board.getBoardNo();
		volBoard.setVolNo(boardNo);
		volunteerService.writeVolunteer(volBoard);
		
		if(image.getImagePath() != null) {
			image.setBoardNo(boardNo);
			volunteerService.uploadImage(image);
		}
		if(file.getFilePath() != null) {
			file.setBoardNo(boardNo);
			volunteerService.uploadFile(file);
		}
		
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

	@GetMapping(path = { "/update/{boardNo}" })
	public String volUpdate(@PathVariable("boardNo") int boardNo, Model model) {
		
		BoardVO volboardUpdate = volunteerService.findBoardListByBoardNo(boardNo);
		List<ImageVO> image = volunteerService.findImageByBoardNo(boardNo);
		List<FileVO> file = volunteerService.findFileByBoardNo(boardNo);
		if (volboardUpdate == null) {
			return "redirect:/volunteer/detail/" + boardNo;
		}		

		model.addAttribute("vUpdate", volboardUpdate);
		model.addAttribute("vImage", image);
		model.addAttribute("vFile", file);
		
		return "/volunteer/volupdate";
	}	
	
	@PostMapping(path = { "/update/{boardNo}" })
	public String volUpdate(@PathVariable("boardNo") int boardNo, BoardVO board, VolunteerVO volBoard, ImageVO image, FileVO file, HttpSession session) {
		MemberVO volMem = (MemberVO) session.getAttribute("loginuser");
		if(volMem == null) {
			return "redirect:/volunteer/detail/" + boardNo;
		}
		
		//where = 보드넘, 업데이트 보드-볼룬티어, 셋 제목 내용 지역 날짜3개 이미지 파일
		
		volunteerService.updateBoard(board);
		volBoard.setVolNo(boardNo);
		volunteerService.updateVolunteer(volBoard);
		
//		if(image.getImagePath() != null) {
//			image.setBoardNo(boardNo);
//			volunteerService.updateImage(image);
//		}
//		if(file.getFilePath() != null) {
//			file.setBoardNo(boardNo);
//			volunteerService.updateFile(file);
//		}
		
		return "redirect:/volunteer/detail/" + boardNo;
	}
	
	@GetMapping(path = { "/delete/{boardNo}" })
	public String volDelete(@PathVariable("boardNo") int boardNo) {
		
		volunteerService.deleteBoard(boardNo);
		
		return "redirect:/volunteer/";
	}
	
	@GetMapping(path = { "/apply/{boardNo}" })
	public String volApply(@PathVariable("boardNo") int boardNo, Model model) {

		List<ApplyVO> applyList = volunteerService.findApplyByBoardNo(boardNo);

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
