package com.project.corona.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
		MemberVO volMem = (MemberVO) session.getAttribute("loginuser");
		if(volMem == null) {
			return "redirect:/volunteer/";
		}
		
		board.setMemberNo(volMem.getMemberNo());
		board.setVolunteers(volBoard);
		volunteerService.writeBoard(board);
		int boardNo = board.getBoardNo();
		volBoard.setVolNo(boardNo);
		volunteerService.writeVolunteer(volBoard);
		
		if(image.getImagePath() != null) {
			image.setBoardNo(boardNo);		
			String[] imagePath = image.getImagePath().split(",");
			String[] imageReal = image.getImageReal().split(",");
			String[] imageSize = image.getImageSize().split(",");
			List<ImageVO> imageList = new ArrayList<>();
			for(int i = 0; i < imagePath.length; i++) {
				image.setImagePath(imagePath[i]);
				image.setImageReal(imageReal[i]);
				image.setImageSize(imageSize[i]);
				imageList.add(image);
				volunteerService.uploadImage(image);
			}
		}
		
		if(file.getFilePath() != null) {
			file.setBoardNo(boardNo);
			String[] filePath = file.getFilePath().split(",");
			String[] fileReal = file.getFileReal().split(",");
			String[] fileSize = file.getFileSize().split(",");
			List<FileVO> fileList = new ArrayList<>();
			for(int i = 0; i < filePath.length; i++) {
				file.setFilePath(filePath[i]);
				file.setFileReal(fileReal[i]);
				file.setFileSize(fileSize[i]);
				fileList.add(file);
				volunteerService.uploadFile(file);
			}
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
	public String volUpdate(@PathVariable("boardNo") int boardNo, Model model, HttpSession session, HttpServletResponse response) throws IOException {
		MemberVO volMem = (MemberVO) session.getAttribute("loginuser");
		BoardVO volboardUpdate = volunteerService.findBoardListByBoardNo(boardNo);
		if (volboardUpdate == null || volMem == null || volboardUpdate.getMemberNo() != volMem.getMemberNo()) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.printf("<script>alert('접근 권한이 없습니다'); location.href='/corona/volunteer/detail/%d';</script>\n", boardNo);
			out.flush();
		}
		List<ImageVO> image = volunteerService.findImageByBoardNo(boardNo);
		List<FileVO> file = volunteerService.findFileByBoardNo(boardNo);
		
		model.addAttribute("vUpdate", volboardUpdate);
		model.addAttribute("vImage", image);
		model.addAttribute("vFile", file);
		
		return "/volunteer/volupdate";
	}	
	
	@PostMapping(path = { "/update/{boardNo}" })
	public String volUpdate(@PathVariable("boardNo") int boardNo, BoardVO board, VolunteerVO volBoard, ImageVO image, FileVO file, int memberNo, HttpSession session, HttpServletResponse response) throws IOException {
		MemberVO volMem = (MemberVO) session.getAttribute("loginuser");
		if(volMem == null || volMem.getMemberNo() != memberNo) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.printf("<script>alert('접근 권한이 없습니다'); location.href='/corona/volunteer/detail/%d';</script>\n", boardNo);
			out.flush();
		}
		
		volunteerService.updateBoard(board);
		volBoard.setVolNo(boardNo);
		volunteerService.updateVolunteer(volBoard);
		
		if(image.getImagePath() != null) {
			volunteerService.deleteImage(boardNo);
			image.setBoardNo(boardNo);		
			String[] imagePath = image.getImagePath().split(",");
			String[] imageReal = image.getImageReal().split(",");
			String[] imageSize = image.getImageSize().split(",");
			List<ImageVO> imageList = new ArrayList<>();
			for(int i = 0; i < imagePath.length; i++) {
				image.setImagePath(imagePath[i]);
				image.setImageReal(imageReal[i]);
				image.setImageSize(imageSize[i]);
				imageList.add(image);
				volunteerService.uploadImage(image);
			}
		}
		
		if(file.getFilePath() != null) {
			volunteerService.deleteFile(boardNo);
			file.setBoardNo(boardNo);
			String[] filePath = file.getFilePath().split(",");
			String[] fileReal = file.getFileReal().split(",");
			String[] fileSize = file.getFileSize().split(",");
			List<FileVO> fileList = new ArrayList<>();
			for(int i = 0; i < filePath.length; i++) {
				file.setFilePath(filePath[i]);
				file.setFileReal(fileReal[i]);
				file.setFileSize(fileSize[i]);
				fileList.add(file);
				volunteerService.uploadFile(file);
			}
		}
		
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
