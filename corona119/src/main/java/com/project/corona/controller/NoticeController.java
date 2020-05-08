package com.project.corona.controller;

import java.util.ArrayList;
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

import com.project.corona.service.NoticeService;
import com.project.corona.service.VolunteerService;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.FileVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.MemberVO;

@Controller
@RequestMapping(path = { "/notice" })
public class NoticeController {
	
	@Autowired
	@Qualifier("noticeService")
	private NoticeService noticeService;
	
	@Autowired
	@Qualifier("volunteerService")
	private VolunteerService volunteerService;
	
	@GetMapping(path = {"", "/"})
	public String noticeList(Model model) {
		
		List<BoardVO> notice = noticeService.findAllNotice();
		model.addAttribute("notice", notice);
		
		return "/notice/notice";
	}
	
	@PostMapping(path = "/write")
	public String noticeWrite(BoardVO board, ImageVO image, FileVO file, HttpSession session) {
		MemberVO admin = (MemberVO) session.getAttribute("loginuser");
		if(admin == null) {
			return "redirect:/admin";
		}
		
		board.setCatNo(4);
		volunteerService.writeBoard(board);
		
		if(image.getImagePath() != null) {
			image.setBoardNo(board.getBoardNo());		
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
			file.setBoardNo(board.getBoardNo());
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
		
		return "redirect:/admin";
	}
	
	@GetMapping(path = {"/detail/{boardNo}"})
	public String detailNotice(@PathVariable("boardNo") int boardNo, Model model) {

		BoardVO noticeDetail = noticeService.findNoticeByBoardNo(boardNo);
		if (noticeDetail == null) {
			return "redirect:/notice";
		}		
		System.out.println(noticeDetail);
		model.addAttribute("noticeDetail", noticeDetail);

		return "/notice/detail";
	}
	


}
